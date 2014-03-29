require 'digest/md5'

module ActiveMerchant #:nodoc:
  module Billing #:nodoc:
    module Integrations #:nodoc:
      module Tenpay
        class Helper < ActiveMerchant::Billing::Integrations::Helper
          # Replace with the real mapping
          mapping :account, 'partner'
          mapping :amount,  'total_fee'
          mapping :order,   'out_trade_no'
          mapping :return_url, 'return_url'
          mapping :notify_url, 'notify_url'
          mapping :body, 'body'
          mapping :spbill_create_ip, 'spbill_create_ip'
          mapping :input_charset, 'input_charset'
          mapping :attach, 'attach'
          mapping :transaction_id, 'transaction_id'

          def initialize(order, account, options = {})
            super
          end

          def sign
            add_field('sign',
                      Digest::MD5.hexdigest("attach=#{attach}&body=#{body}" +
                      "&total_fee=#{amount}&input_charset=#{input_charset}" +
                      "&notify_url=#{notify_url}&out_trade_no=#{order}%partner=#{account}" + 
                      "&return_url=#{return_url}&spbill_create_ip=#{spbill_create_ip}" +
                      "&transaction_id=#{transaction_id}&key=#{KEY}").upcase)
          end

        end
      end
    end
  end
end
