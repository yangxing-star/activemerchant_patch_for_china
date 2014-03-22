require 'digest/md5'

module ActiveMerchant #:nodoc:
  module Billing #:nodoc:
    module Integrations #:nodoc:
      module Tenpay
        class Helper < ActiveMerchant::Billing::Integrations::Helper
          # Replace with the real mapping
          mapping :account, 'bargainor_id'
          mapping :amount, 'total_fee'

          mapping :order, 'sp_billno'

          mapping :cmdno, 'cmdno'
          mapping :return_url, 'return_url'
          mapping :notify_url, 'notify_url'
          mapping :description, 'desc'
          mapping :attach, 'attach'
          mapping :date, 'date'
          mapping :currency, 'fee_type'
          mapping :transaction_id, 'transaction_id'
          mapping :spbill_create_ip, 'spbill_create_ip'
          mapping :input_charset, 'input_charset'

          def initialize(order, account, options = {})
            super
          end

          def sign
            add_field('sign',
                      Digest::MD5.hexdigest("cmdno=#{cmdno}&date=#{date}&bargainor_id=#{account}" +
                      "&transaction_id=#{transaction_id}&sp_billno=#{order}&total_fee=#{amount}" +
                      "&fee_type=#{currency}&return_url=#{return_url}&attach=#{attach}" +
                      "&spbill_create_ip=#{spbill_create_ip}&key=#{KEY}").upcase)
          end

        end
      end
    end
  end
end
