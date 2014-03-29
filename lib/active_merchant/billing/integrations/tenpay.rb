require File.dirname(__FILE__) + '/tenpay/helper.rb'
require File.dirname(__FILE__) + '/tenpay/return.rb'
require File.dirname(__FILE__) + '/tenpay/notification.rb'

module ActiveMerchant #:nodoc:
  module Billing #:nodoc:
    module Integrations #:nodoc:
      module Tenpay

        mattr_accessor :service_url
        self.service_url = 'https://gw.tenpay.com/gateway/pay.htm'

        def self.return(query_string)
          Return.new(query_string)
        end
      end
    end
  end
end