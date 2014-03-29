require 'digest/md5'

module ActiveMerchant #:nodoc:
  module Billing #:nodoc:
    module Integrations #:nodoc:
      module Tenpay
        class Return < ActiveMerchant::Billing::Integrations::Return

          def account
            @params["partner"]
          end

          def order
            @params["out_trade_no"]
          end

          def amount
            @params["total_fee"]
          end

          def success?
            return false unless @params["trade_state"] == "0"
            unless account == ACCOUNT
              @message = "Tenpay Error: INCORRECT_ACCOUNT"
              return false
            end
            return true
          end

          def message
            @message
          end

        end
      end
    end
  end
end