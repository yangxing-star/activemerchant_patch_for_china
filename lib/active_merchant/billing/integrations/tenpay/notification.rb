module ActiveMerchant #:nodoc:
  module Billing #:nodoc:
    module Integrations #:nodoc:
      module Tenpay
        class Notification < ActiveMerchant::Billing::Integrations::Notification

          def status
            return "TRADE_SUCCESS" if @params["trade_state"] == "0"
            "TRADE_FAIL"
          end

          def acknowledge
            return false unless @params["trade_state"] == "0"
            true
          end

          def trade_no
            @params["transaction_id"]
          end

          [ 'out_trade_no', 'total_fee', 'trade_no','buyer_email', 'buyer_id', ].each do |param|
            self.class_eval <<-EOF
              def #{param}
                params['#{param}']
              end
            EOF
          end

        end
      end
    end
  end
end