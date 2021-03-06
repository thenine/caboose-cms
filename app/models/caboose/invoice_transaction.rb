
module Caboose
  class InvoiceTransaction < ActiveRecord::Base
    self.table_name  = 'store_invoice_transactions'
    self.primary_key = 'id'
    
    belongs_to :invoice
    belongs_to :parent, :class_name => 'Caboose::InvoiceTransaction', :foreign_key => :parent_id
    attr_accessible :id,    
      :invoice_id,
      :parent_id,      
      :transaction_id,
      :transaction_type,
      :payment_processor,
      :amount,
      :amount_refunded,
      :auth_code,
      :date_processed,
      :response_code,
      :success,
      :captured,
      :refunded
        
    TYPE_AUTHORIZE = 'auth'
    TYPE_CAPTURE   = 'capture'
    TYPE_AUTHCAP   = 'authcap'    
    TYPE_VOID      = 'void'
    TYPE_REFUND    = 'refund'
    
    after_initialize :check_nil_fields
    
    def children
      InvoiceTransaction.where(:parent_id => self.id).all
    end
    
    def check_nil_fields
      self.amount = 0.00 if self.amount.nil?        
    end
    
    def self.type_from_authnet_status(status)
      case status
        when 'settledSuccessfully'        then InvoiceTransaction::TYPE_CAPTURE
        when 'voided'                     then InvoiceTransaction::TYPE_VOID
        when 'declined'                   then InvoiceTransaction::TYPE_AUTHORIZE
        when 'authorizedPendingCapture'   then InvoiceTransaction::TYPE_AUTHORIZE
        when 'refundSettledSuccessfully'  then InvoiceTransaction::TYPE_REFUND
      end
    end
    
    # Capture funds from a previously authorized transaction
    def capture(amount = nil)
      
      return { :error => "This invoice doesn't seem to be authorized." } if !self.success
      
      ct = InvoiceTransaction.where(:parent_id => self.id, :transaction_type => InvoiceTransaction::TYPE_CAPTURE, :success => true).first      
      return { :error => "Funds for this invoice have already been captured." } if ct
      
      # Make sure the amount given isn't greater than the invoice total      
      return { :error => "Amount given to capture is greater than the current invoice total." } if amount && amount.to_f > self.invoice.total.to_f        
      amount = self.invoice.total if amount.nil?      
            
      resp = Caboose::StdClass.new
      sc = self.invoice.site.store_config                
      case sc.pp_name
                                  
        when StoreConfig::PAYMENT_PROCESSOR_STRIPE
                                                                                    
          Stripe.api_key = sc.stripe_secret_key.strip
          bt = nil
          begin            
            c = Stripe::Charge.retrieve(self.transaction_id)            
            return { :error => "Amount given to capture is greater than the amount authorized. amount = #{amount}, c.amount = #{c.amount}" } if (amount*100).to_i > c.amount            
            amount = (amount.to_f * 100.0).to_i
            if amount == c.amount              
              c = c.capture
            else
              c = c.capture({ :amount => amount })
            end
            bt = Stripe::BalanceTransaction.retrieve(c.balance_transaction)
          rescue Exception => ex
            resp.error = "Error during capture process\n#{ex.message}"                
          end
          
          if resp.error.nil?
            InvoiceTransaction.create(
              :invoice_id => self.invoice_id,
              :parent_id => self.id,
              :transaction_id => bt.id,
              :transaction_type => InvoiceTransaction::TYPE_CAPTURE,
              :payment_processor => sc.pp_name,
              :amount => bt.amount / 100.0,                
              :date_processed => DateTime.strptime(bt.created.to_s, '%s'),
              :success => bt.status == 'succeeded' || bt.status == 'pending'
            )
            if bt.status == 'succeeded' || bt.status == 'pending'
              self.captured = true
              self.save              
              self.invoice.financial_status = Invoice::FINANCIAL_STATUS_CAPTURED
              self.invoice.save
              resp.success = true
            else
              resp.error = "Error capturing funds."
            end
          end
          
      end
      return resp
      
    end
        
    def refund(amount_to_refund = nil)
      
      resp = StdClass.new
      
      amount_available_to_refund = self.amount - (self.amount_refunded ? self.amount_refunded : 0.00)
      amount_to_refund = amount_available_to_refund if amount_to_refund.nil?

      if self.transaction_type != InvoiceTransaction::TYPE_AUTHORIZE && self.transaction_type != InvoiceTransaction::TYPE_AUTHCAP                
        resp.error = "You can only refund authorize transactions."      
      elsif amount_to_refund > amount_available_to_refund
        resp.error = "The amount to refund exceeds the amount available to refund."      
      else
                        
        sc = self.invoice.site.store_config                
        case sc.pp_name
                                    
          when StoreConfig::PAYMENT_PROCESSOR_STRIPE
                                                                              
            Stripe.api_key = sc.stripe_secret_key.strip
            bt = nil
            begin
              r = Stripe::Refund.create(:charge => self.transaction_id, :amount => (amount_to_refund * 100).to_i)
            rescue Exception => ex              
              resp.error = "Error during refund process\n#{ex.message}"                
            end
            
            if resp.error.nil?
              it = InvoiceTransaction.create(
                :invoice_id => self.invoice_id,
                :parent_id => self.id,
                :transaction_id => r.id,
                :transaction_type => InvoiceTransaction::TYPE_REFUND,
                :payment_processor => sc.pp_name,
                :amount => r.amount / 100.0,
                :date_processed => DateTime.strptime(r.created.to_s, '%s'),
                :success => r.status == 'succeeded' || r.status == 'pending'
              )
              if it.success
                self.amount_refunded = (self.amount_refunded ? self.amount_refunded : 0.00) + amount_to_refund
                self.refunded = self.amount_refunded >= self.amount                
                self.save
                if self.amount_refunded >= self.invoice.total
                  self.invoice.financial_status = Invoice::FINANCIAL_STATUS_REFUNDED
                  self.invoice.save
                end                
                resp.success = true
              else
                resp.error = "Error refunding transaction."
              end
            end            
          
        end        
      end      
      return resp
    end
    
    def void
      
      resp = StdClass.new                                    
      sc = self.invoice.site.store_config                
      case sc.pp_name
                                  
        when StoreConfig::PAYMENT_PROCESSOR_STRIPE
          return self.refund                                                                                                  
        
      end
      return resp
    end
    
  end
end
   
    