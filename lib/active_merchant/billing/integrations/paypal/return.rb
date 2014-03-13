module ActiveMerchant #:nodoc:
  module Billing #:nodoc:
    module Integrations #:nodoc:
      module Paypal
        class Return < ActiveMerchant::Billing::Integrations::Return

          def order
            @params["billing_id"]
          end

          def amount
            @params["total_fee"]
          end

          def initialize(query_string)
            super
          end

        end
      end
    end
  end
end