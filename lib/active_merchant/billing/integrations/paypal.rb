require File.dirname(__FILE__) + '/paypal/return.rb'

module ActiveMerchant #:nodoc:
  module Billing #:nodoc:
    module Integrations #:nodoc:
      module Paypal
        def self.return(query_string)
          Return.new(query_string)
        end
      end
    end
  end
end