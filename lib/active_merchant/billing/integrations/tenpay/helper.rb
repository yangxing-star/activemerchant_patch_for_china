require 'cgi'
require 'digest/md5'

module ActiveMerchant #:nodoc:
  module Billing #:nodoc:
    module Integrations #:nodoc:
      module Tenpay
        class Helper < ActiveMerchant::Billing::Integrations::Helper
          # Replace with the real mapping
          mapping :account, 'partner'
          mapping :amount, 'total_fee'

          mapping :order, 'out_trade_no'

          mapping :cmdno, 'cmdno'
          mapping :return_url, 'return_url'

          mapping :body, 'body'
          mapping :subject, 'subject'
          mapping :charset, 'input_charset'

          mapping :notify_url, 'notify_url'
          mapping :return_url, 'return_url'
          
          mapping :attach, 'attach'
          mapping :date, 'date'
          mapping :currency, 'fee_type'
          mapping :transaction_id, 'transaction_id'

          def initialize(order, account, options = {})
            super
            add_field('bank_type', 'DEFAULT')
          end

          def sign
            add_field('sign',
                      Digest::MD5.hexdigest((@fields.sort.collect{|s|s[0]+"="+CGI.unescape(s[1])}).join("&")+KEY)
                     )
            add_field('sign_type', 'MD5')
            nil
          end

        end
      end
    end
  end
end
