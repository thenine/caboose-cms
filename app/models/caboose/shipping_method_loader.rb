
module Caboose
  class ShippingMethodLoader
    
    def self.load_shipping_methods
           
      ShippingMethod.create(:carrier => 'UPS'   , :service_code => '1DM' , :service_name => 'UPS Next Day Air Early AM'      )                                  
      ShippingMethod.create(:carrier => 'UPS'   , :service_code => '1DA' , :service_name => 'UPS Next Day Air'               )
      ShippingMethod.create(:carrier => 'UPS'   , :service_code => '1DP' , :service_name => 'UPS Next Day Air Saver'         )
      ShippingMethod.create(:carrier => 'UPS'   , :service_code => '2DM' , :service_name => 'UPS 2nd Day Air AM'             )
      ShippingMethod.create(:carrier => 'UPS'   , :service_code => '2DA' , :service_name => 'UPS 2nd Day Air'                )
      ShippingMethod.create(:carrier => 'UPS'   , :service_code => '3DS' , :service_name => 'UPS 3 Day Select GND Ground'    )
      ShippingMethod.create(:carrier => 'UPS'   , :service_code => 'EP'  , :service_name => 'UPS Worldwide Express Plus'     )
      ShippingMethod.create(:carrier => 'UPS'   , :service_code => 'ES'  , :service_name => 'UPS Worldwide Express'          )
      ShippingMethod.create(:carrier => 'UPS'   , :service_code => 'SV'  , :service_name => 'UPS Worldwide Saver (Express)'  )
      ShippingMethod.create(:carrier => 'UPS'   , :service_code => 'EX'  , :service_name => 'UPS Worldwide Expedited'        )
      ShippingMethod.create(:carrier => 'UPS'   , :service_code => 'ST'  , :service_name => 'UPS Standard'                   )        
      ShippingMethod.create(:carrier => 'FedEx' , :service_code => 'FEDEXGROUND'                  , :service_name => 'FedEx Ground&#174; (Business addresses only)'           )             
      ShippingMethod.create(:carrier => 'FedEx' , :service_code => 'GROUNDHOMEDELIVERY'           , :service_name => 'FedEx Home Delivery&#174; (Residential addresses only)' )  
      ShippingMethod.create(:carrier => 'FedEx' , :service_code => 'FEDEXEXPRESSSAVER'            , :service_name => 'FedEx Express Saver&#174;'                              )
      ShippingMethod.create(:carrier => 'FedEx' , :service_code => 'FEDEX2DAY'                    , :service_name => 'FedEx 2Day&#174;'                                       )
      ShippingMethod.create(:carrier => 'FedEx' , :service_code => 'STANDARDOVERNIGHT'            , :service_name => 'FedEx Standard Overnight&#174;'                         )
      ShippingMethod.create(:carrier => 'FedEx' , :service_code => 'PRIORITYOVERNIGHT'            , :service_name => 'FedEx Priority Overnight&#174;'                         )
      ShippingMethod.create(:carrier => 'FedEx' , :service_code => 'FIRSTOVERNIGHT'               , :service_name => 'FedEx First Overnight&#174;'                            )
      ShippingMethod.create(:carrier => 'FedEx' , :service_code => 'FEDEXGROUND'                  , :service_name => 'FedEx International Ground&#174;'                       )
      ShippingMethod.create(:carrier => 'FedEx' , :service_code => 'INTERNATIONALECONOMY'         , :service_name => 'FedEx International Economy&#174;'                      )
      ShippingMethod.create(:carrier => 'FedEx' , :service_code => 'INTERNATIONALPRIORITY'        , :service_name => 'FedEx International Priority&#174;'                     )
      ShippingMethod.create(:carrier => 'FedEx' , :service_code => 'INTERNATIONALFIRST'           , :service_name => 'FedEx International First&#174;'                        )
      ShippingMethod.create(:carrier => 'FedEx' , :service_code => 'FEDEX1DAYFREIGHT'             , :service_name => 'FedEx 1Day&#174; Freight'                               )
      ShippingMethod.create(:carrier => 'FedEx' , :service_code => 'FEDEX2DAYFREIGHT'             , :service_name => 'FedEx 2Day&#174; Freight'                               )
      ShippingMethod.create(:carrier => 'FedEx' , :service_code => 'FEDEX3DAYFREIGHT'             , :service_name => 'FedEx 3Day&#174; Freight'                               )
      ShippingMethod.create(:carrier => 'FedEx' , :service_code => 'INTERNATIONALPRIORITYFREIGHT' , :service_name => 'FedEx International Priority&#174; Freight'             )          
      ShippingMethod.create(:carrier => 'USPS'  , :service_code => 'Library Mail Parcel'                                                                         , :service_name => 'USPS Library'                                                                     )
      ShippingMethod.create(:carrier => 'USPS'  , :service_code => 'Media Mail Parcel'                                                                           , :service_name => 'USPS Media Mail'                                                                  )
      ShippingMethod.create(:carrier => 'USPS'  , :service_code => 'Bound Printed Matter'                                                                        , :service_name => 'USPS BPM (Bound Printed Matter)'                                                  )
      ShippingMethod.create(:carrier => 'USPS'  , :service_code => 'Standard Post<sup>&#174;</sup>'                                                              , :service_name => 'USPS Standard'                                                                    )
      ShippingMethod.create(:carrier => 'USPS'  , :service_code => 'Priority Mail<sup>&#174;</sup>'                                                              , :service_name => 'USPS Priority Mail'                                                               )
      ShippingMethod.create(:carrier => 'USPS'  , :service_code => 'Priority Mail 1-Day<sup>&#8482;</sup>'                                                       , :service_name => 'USPS Priority Mail 1-Day'                                                         )
      ShippingMethod.create(:carrier => 'USPS'  , :service_code => 'Priority Mail 2-Day<sup>&#8482;</sup>'                                                       , :service_name => 'USPS Priority Mail 2-Day'                                                         )
      ShippingMethod.create(:carrier => 'USPS'  , :service_code => 'Priority Mail 3-Day<sup>&#8482;</sup>'                                                       , :service_name => 'USPS Priority Mail 3-Day'                                                         )
      ShippingMethod.create(:carrier => 'USPS'  , :service_code => 'Priority Mail DPO<sup>&#8482;</sup>'                                                         , :service_name => 'USPS Priority Mail DPO'                                                           )
      ShippingMethod.create(:carrier => 'USPS'  , :service_code => 'Priority Mail Military<sup>&#8482;</sup>'                                                    , :service_name => 'USPS Priority Mail Military'                                                      )
      ShippingMethod.create(:carrier => 'USPS'  , :service_code => 'Priority Mail<sup>&#8482;</sup> Flat Rate Envelope'                                          , :service_name => 'USPS Priority Mail Flat Rate Envelope'                                            )
      ShippingMethod.create(:carrier => 'USPS'  , :service_code => 'Priority Mail 1-Day<sup>&#8482;</sup> Flat Rate Envelope'                                    , :service_name => 'USPS Priority Mail 1-Day Flat Rate Envelope'                                      )
      ShippingMethod.create(:carrier => 'USPS'  , :service_code => 'Priority Mail 2-Day<sup>&#8482;</sup> Flat Rate Envelope'                                    , :service_name => 'USPS Priority Mail 2-Day Flat Rate Envelope'                                      )
      ShippingMethod.create(:carrier => 'USPS'  , :service_code => 'Priority Mail 3-Day<sup>&#8482;</sup> Flat Rate Envelope'                                    , :service_name => 'USPS Priority Mail 3-Day Flat Rate Envelope'                                      )
      ShippingMethod.create(:carrier => 'USPS'  , :service_code => 'Priority Mail DPO<sup>&#8482;</sup> Flat Rate Envelope'                                      , :service_name => 'USPS Priority Mail DPO Flat Rate Envelope'                                        )
      ShippingMethod.create(:carrier => 'USPS'  , :service_code => 'Priority Mail Military<sup>&#8482;</sup> Flat Rate Envelope'                                 , :service_name => 'USPS Priority Mail Military Flat Rate Envelope'                                   )
      ShippingMethod.create(:carrier => 'USPS'  , :service_code => 'Priority Mail<sup>&#8482;</sup> Small Flat Rate Box'                                         , :service_name => 'USPS Priority Mail Small Flat Rate Box'                                           )
      ShippingMethod.create(:carrier => 'USPS'  , :service_code => 'Priority Mail 1-Day<sup>&#8482;</sup> Small Flat Rate Box'                                   , :service_name => 'USPS Priority Mail 1-Day Small Flat Rate Box'                                     )
      ShippingMethod.create(:carrier => 'USPS'  , :service_code => 'Priority Mail 2-Day<sup>&#8482;</sup> Small Flat Rate Box'                                   , :service_name => 'USPS Priority Mail 2-Day Small Flat Rate Box'                                     )
      ShippingMethod.create(:carrier => 'USPS'  , :service_code => 'Priority Mail 3-Day<sup>&#8482;</sup> Small Flat Rate Box'                                   , :service_name => 'USPS Priority Mail 3-Day Small Flat Rate Box'                                     )
      ShippingMethod.create(:carrier => 'USPS'  , :service_code => 'Priority Mail DPO<sup>&#8482;</sup> Small Flat Rate Box'                                     , :service_name => 'USPS Priority Mail DPO Small Flat Rate Box'                                       )
      ShippingMethod.create(:carrier => 'USPS'  , :service_code => 'Priority Mail Military<sup>&#8482;</sup> Small Flat Rate Box'                                , :service_name => 'USPS Priority Mail Military Small Flat Rate Box'                                  )
      ShippingMethod.create(:carrier => 'USPS'  , :service_code => 'Priority Mail<sup>&#8482;</sup> Medium Flat Rate Box'                                        , :service_name => 'USPS Priority Mail Medium Flat Rate Box'                                          )
      ShippingMethod.create(:carrier => 'USPS'  , :service_code => 'Priority Mail 1-Day<sup>&#8482;</sup> Medium Flat Rate Box'                                  , :service_name => 'USPS Priority Mail 1-Day Medium Flat Rate Box'                                    )
      ShippingMethod.create(:carrier => 'USPS'  , :service_code => 'Priority Mail 2-Day<sup>&#8482;</sup> Medium Flat Rate Box'                                  , :service_name => 'USPS Priority Mail 2-Day Medium Flat Rate Box'                                    )
      ShippingMethod.create(:carrier => 'USPS'  , :service_code => 'Priority Mail 3-Day<sup>&#8482;</sup> Medium Flat Rate Box'                                  , :service_name => 'USPS Priority Mail 3-Day Medium Flat Rate Box'                                    )
      ShippingMethod.create(:carrier => 'USPS'  , :service_code => 'Priority Mail DPO<sup>&#8482;</sup> Medium Flat Rate Box'                                    , :service_name => 'USPS Priority Mail DPO Medium Flat Rate Box'                                      )
      ShippingMethod.create(:carrier => 'USPS'  , :service_code => 'Priority Mail Military<sup>&#8482;</sup> Medium Flat Rate Box'                               , :service_name => 'USPS Priority Mail Military Medium Flat Rate Box'                                 )
      ShippingMethod.create(:carrier => 'USPS'  , :service_code => 'Priority Mail<sup>&#8482;</sup> Large Flat Rate Box'                                         , :service_name => 'USPS Priority Mail Large Flat Rate Box'                                           )
      ShippingMethod.create(:carrier => 'USPS'  , :service_code => 'Priority Mail 1-Day<sup>&#8482;</sup> Large Flat Rate Box'                                   , :service_name => 'USPS Priority Mail 1-Day Large Flat Rate Box'                                     )
      ShippingMethod.create(:carrier => 'USPS'  , :service_code => 'Priority Mail 2-Day<sup>&#8482;</sup> Large Flat Rate Box'                                   , :service_name => 'USPS Priority Mail 2-Day Large Flat Rate Box'                                     )
      ShippingMethod.create(:carrier => 'USPS'  , :service_code => 'Priority Mail 3-Day<sup>&#8482;</sup> Large Flat Rate Box'                                   , :service_name => 'USPS Priority Mail 3-Day Large Flat Rate Box'                                     )
      ShippingMethod.create(:carrier => 'USPS'  , :service_code => 'Priority Mail DPO<sup>&#8482;</sup> Large Flat Rate Box'                                     , :service_name => 'USPS Priority Mail DPO Large Flat Rate Box'                                       )
      ShippingMethod.create(:carrier => 'USPS'  , :service_code => 'Priority Mail Military<sup>&#8482;</sup> Large Flat Rate Box APO/FPO/DPO'                    , :service_name => 'USPS Priority Mail Military Large Flat Rate Box'                                  )
      ShippingMethod.create(:carrier => 'USPS'  , :service_code => 'Priority Mail International<sup>&#174;</sup>'                                                , :service_name => 'USPS Priority Mail International'                                                 )
      ShippingMethod.create(:carrier => 'USPS'  , :service_code => 'Priority Mail International<sup>&#174;</sup> Flat Rate Envelope'                             , :service_name => 'USPS Priority Mail International Flat Rate Envelope'                              )
      ShippingMethod.create(:carrier => 'USPS'  , :service_code => 'Priority Mail International<sup>&#174;</sup> Small Flat Rate Box'                            , :service_name => 'USPS Priority Mail International Small Flat Rate Box'                             )
      ShippingMethod.create(:carrier => 'USPS'  , :service_code => 'Priority Mail International<sup>&#174;</sup> Medium Flat Rate Box'                           , :service_name => 'USPS Priority Mail International Medium Flat Rate Box'                            )
      ShippingMethod.create(:carrier => 'USPS'  , :service_code => 'Priority Mail International<sup>&#174;</sup> Large Flat Rate Box'                            , :service_name => 'USPS Priority Mail International Large Flat Rate Box'                             )
      ShippingMethod.create(:carrier => 'USPS'  , :service_code => 'First-Class Mail<sup>&#174;</sup> Parcel'                                                    , :service_name => 'USPS First-Class Mail Package'                                                    )
      ShippingMethod.create(:carrier => 'USPS'  , :service_code => 'First-Class Mail<sup>&#174;</sup> Large Envelope'                                            , :service_name => 'USPS First-Class Mail Large Envelope'                                             )
      ShippingMethod.create(:carrier => 'USPS'  , :service_code => 'First-Class Mail<sup>&#174;</sup> Letter'                                                    , :service_name => 'USPS First-Class Mail Letter'                                                     )
      ShippingMethod.create(:carrier => 'USPS'  , :service_code => 'First-Class Mail<sup>&#174;</sup> International Letter'                                      , :service_name => 'USPS First-Class Mail International Letter'                                       )
      ShippingMethod.create(:carrier => 'USPS'  , :service_code => 'First-Class Mail<sup>&#174;</sup> International Large Envelope'                              , :service_name => 'USPS First-Class Mail International Large Envelope'                               )
      ShippingMethod.create(:carrier => 'USPS'  , :service_code => 'First-Class Package International Service<sup>&#8482;</sup>'                                 , :service_name => 'USPS First-Class Package International Service'                                   )
      ShippingMethod.create(:carrier => 'USPS'  , :service_code => 'Priority Mail Express<sup>&#8482;</sup>'                                                     , :service_name => 'USPS Priority Mail Express'                                                       )
      ShippingMethod.create(:carrier => 'USPS'  , :service_code => 'Priority Mail Express 1-Day<sup>&#8482;</sup>'                                               , :service_name => 'USPS Priority Mail Express 1-Day'                                                 )
      ShippingMethod.create(:carrier => 'USPS'  , :service_code => 'Priority Mail Express 2-Day<sup>&#8482;</sup>'                                               , :service_name => 'USPS Priority Mail Express 2-Day'                                                 )
      ShippingMethod.create(:carrier => 'USPS'  , :service_code => 'Priority Mail Express 3-Day<sup>&#8482;</sup>'                                               , :service_name => 'USPS Priority Mail Express 3-Day'                                                 )
      ShippingMethod.create(:carrier => 'USPS'  , :service_code => 'Priority Mail Express DPO<sup>&#8482;</sup>'                                                 , :service_name => 'USPS Priority Mail Express DPO'                                                   )
      ShippingMethod.create(:carrier => 'USPS'  , :service_code => 'Priority Mail Express Military<sup>&#8482;</sup>'                                            , :service_name => 'USPS Priority Mail Express Military'                                              )
      ShippingMethod.create(:carrier => 'USPS'  , :service_code => 'Priority Mail Express<sup>&#8482;</sup> Flat Rate Envelope'                                  , :service_name => 'USPS Priority Mail Express Flat Rate Envelope'                                    )
      ShippingMethod.create(:carrier => 'USPS'  , :service_code => 'Priority Mail Express 1-Day<sup>&#8482;</sup> Flat Rate Envelope'                            , :service_name => 'USPS Priority Mail Express 1-Day Flat Rate Envelope'                              )
      ShippingMethod.create(:carrier => 'USPS'  , :service_code => 'Priority Mail Express 2-Day<sup>&#8482;</sup> Flat Rate Envelope'                            , :service_name => 'USPS Priority Mail Express 2-Day Flat Rate Envelope'                              )
      ShippingMethod.create(:carrier => 'USPS'  , :service_code => 'Priority Mail Express 3-Day<sup>&#8482;</sup> Flat Rate Envelope'                            , :service_name => 'USPS Priority Mail Express 3-Day Flat Rate Envelope'                              )
      ShippingMethod.create(:carrier => 'USPS'  , :service_code => 'Priority Mail Express DPO<sup>&#8482;</sup> Flat Rate Envelope'                              , :service_name => 'USPS Priority Mail Express DPO Flat Rate Envelope'                                )
      ShippingMethod.create(:carrier => 'USPS'  , :service_code => 'Priority Mail Express Military<sup>&#8482;</sup> Flat Rate Envelope'                         , :service_name => 'USPS Priority Mail Express Military Flat Rate Envelope'                           )
      ShippingMethod.create(:carrier => 'USPS'  , :service_code => 'Priority Mail Express<sup>&#8482;</sup> Hold For Pickup'                                     , :service_name => 'USPS Priority Mail Express Hold for Pickup'                                       )
      ShippingMethod.create(:carrier => 'USPS'  , :service_code => 'Priority Mail Express 1-Day<sup>&#8482;</sup> Hold For Pickup'                               , :service_name => 'USPS Priority Mail Express 1-Day Hold for Pickup'                                 )
      ShippingMethod.create(:carrier => 'USPS'  , :service_code => 'Priority Mail Express 2-Day<sup>&#8482;</sup> Hold For Pickup'                               , :service_name => 'USPS Priority Mail Express 2-Day Hold for Pickup'                                 )
      ShippingMethod.create(:carrier => 'USPS'  , :service_code => 'Priority Mail Express 3-Day<sup>&#8482;</sup> Hold For Pickup'                               , :service_name => 'USPS Priority Mail Express 3-Day Hold for Pickup'                                 )
      ShippingMethod.create(:carrier => 'USPS'  , :service_code => 'Priority Mail Express DPO<sup>&#8482;</sup> Hold For Pickup'                                 , :service_name => 'USPS Priority Mail Express DPO Hold for Pickup'                                   )
      ShippingMethod.create(:carrier => 'USPS'  , :service_code => 'Priority Mail Express Military<sup>&#8482;</sup> Hold For Pickup'                            , :service_name => 'USPS Priority Mail Express Military Hold for Pickup'                              )
      ShippingMethod.create(:carrier => 'USPS'  , :service_code => 'Priority Mail Express<sup>&#8482;</sup> Flat Rate Envelope Hold For Pickup'                  , :service_name => 'USPS Priority Mail Express Flat Rate Envelope Hold for Pickup'                    )
      ShippingMethod.create(:carrier => 'USPS'  , :service_code => 'Priority Mail Express 1-Day<sup>&#8482;</sup> Flat Rate Envelope Hold For Pickup'            , :service_name => 'USPS Priority Mail Express 1-Day Flat Rate Envelope Hold for Pickup'              )
      ShippingMethod.create(:carrier => 'USPS'  , :service_code => 'Priority Mail Express 2-Day<sup>&#8482;</sup> Flat Rate Envelope Hold For Pickup'            , :service_name => 'USPS Priority Mail Express 2-Day Flat Rate Envelope Hold for Pickup'              )
      ShippingMethod.create(:carrier => 'USPS'  , :service_code => 'Priority Mail Express 3-Day<sup>&#8482;</sup> Flat Rate Envelope Hold For Pickup'            , :service_name => 'USPS Priority Mail Express 3-Day Flat Rate Envelope Hold for Pickup'              )
      ShippingMethod.create(:carrier => 'USPS'  , :service_code => 'Priority Mail Express DPO<sup>&#8482;</sup> Flat Rate Envelope Hold For Pickup'              , :service_name => 'USPS Priority Mail Express DPO Flat Rate Envelope Hold for Pickup'                )
      ShippingMethod.create(:carrier => 'USPS'  , :service_code => 'Priority Mail Express Military<sup>&#8482;</sup> Flat Rate Envelope Hold For Pickup'         , :service_name => 'USPS Priority Mail Express Military Flat Rate Envelope Hold for Pickup'           )
      ShippingMethod.create(:carrier => 'USPS'  , :service_code => 'Priority Mail Express<sup>&#8482;</sup> Sunday/Holiday Delivery'                             , :service_name => 'USPS Priority Mail Express Sunday/Holiday Guarantee'                              )
      ShippingMethod.create(:carrier => 'USPS'  , :service_code => 'Priority Mail Express 1-Day<sup>&#8482;</sup> Sunday/Holiday Delivery'                       , :service_name => 'USPS Priority Mail Express 1-Day Sunday/Holiday Guarantee'                        )
      ShippingMethod.create(:carrier => 'USPS'  , :service_code => 'Priority Mail Express 2-Day<sup>&#8482;</sup> Sunday/Holiday Delivery'                       , :service_name => 'USPS Priority Mail Express 2-Day Sunday/Holiday Guarantee'                        )
      ShippingMethod.create(:carrier => 'USPS'  , :service_code => 'Priority Mail Express 3-Day<sup>&#8482;</sup> Sunday/Holiday Delivery'                       , :service_name => 'USPS Priority Mail Express 3-Day Sunday/Holiday Guarantee'                        )
      ShippingMethod.create(:carrier => 'USPS'  , :service_code => 'Priority Mail Express DPO<sup>&#8482;</sup> Sunday/Holiday Delivery'                         , :service_name => 'USPS Priority Mail Express DPO Sunday/Holiday Guarantee'                          )
      ShippingMethod.create(:carrier => 'USPS'  , :service_code => 'Priority Mail Express Military<sup>&#8482;</sup> Sunday/Holiday Delivery'                    , :service_name => 'USPS Priority Mail Express Military Sunday/Holiday Guarantee'                     )
      ShippingMethod.create(:carrier => 'USPS'  , :service_code => 'Priority Mail Express<sup>&#8482;</sup> Sunday/Holiday Delivery Flat Rate Envelope'          , :service_name => 'USPS Priority Mail Express Flat-Rate Envelope Sunday/Holiday Guarantee'           )
      ShippingMethod.create(:carrier => 'USPS'  , :service_code => 'Priority Mail Express 1-Day<sup>&#8482;</sup> Sunday/Holiday Delivery Flat Rate Envelope'    , :service_name => 'USPS Priority Mail Express 1-Day Flat-Rate Envelope Sunday/Holiday Guarantee'     )
      ShippingMethod.create(:carrier => 'USPS'  , :service_code => 'Priority Mail Express 2-Day<sup>&#8482;</sup> Sunday/Holiday Delivery Flat Rate Envelope'    , :service_name => 'USPS Priority Mail Express 2-Day Flat-Rate Envelope Sunday/Holiday Guarantee'     )
      ShippingMethod.create(:carrier => 'USPS'  , :service_code => 'Priority Mail Express 3-Day<sup>&#8482;</sup> Sunday/Holiday Delivery Flat Rate Envelope'    , :service_name => 'USPS Priority Mail Express 3-Day Flat-Rate Envelope Sunday/Holiday Guarantee'     )
      ShippingMethod.create(:carrier => 'USPS'  , :service_code => 'Priority Mail Express DPO<sup>&#8482;</sup> Sunday/Holiday Delivery Flat Rate Envelope'      , :service_name => 'USPS Priority Mail Express DPO Flat-Rate Envelope Sunday/Holiday Guarantee'       )
      ShippingMethod.create(:carrier => 'USPS'  , :service_code => 'Priority Mail Express Military<sup>&#8482;</sup> Sunday/Holiday Delivery Flat Rate Envelope' , :service_name => 'USPS Priority Mail Express Military Flat-Rate Envelope Sunday/Holiday Guarantee'  )
      ShippingMethod.create(:carrier => 'USPS'  , :service_code => 'Priority Mail Express International<sup>&#8482;</sup>'                                       , :service_name => 'USPS Priority Mail Express International'                                         )
      ShippingMethod.create(:carrier => 'USPS'  , :service_code => 'Priority Mail Express International<sup>&#8482;</sup> Flat Rate Envelope'                    , :service_name => 'USPS Priority Mail Express International Flat Rate Envelope'                      )
      ShippingMethod.create(:carrier => 'USPS'  , :service_code => 'Global Express Guaranteed<sup>&#174;</sup> (GXG)'                                            , :service_name => 'USPS Global Express Guaranteed (GXG)'                                             )
      ShippingMethod.create(:carrier => 'USPS'  , :service_code => 'Global Express Guaranteed<sup>&#174;</sup> Non-Document Rectangular'                         , :service_name => 'USPS Global Express Guaranteed Non-Document Rectangular'                          )
      ShippingMethod.create(:carrier => 'USPS'  , :service_code => 'Global Express Guaranteed<sup>&#174;</sup> Non-Document Non-Rectangular'                     , :service_name => 'USPS Global Express Guaranteed Non-Document Non-Rectangular'                      )
      ShippingMethod.create(:carrier => 'USPS'  , :service_code => 'USPS GXG<sup>&#8482;</sup> Envelopes'                                                        , :service_name => 'USPS GXG Envelopes'                                                               )
    end
        
  end
end
