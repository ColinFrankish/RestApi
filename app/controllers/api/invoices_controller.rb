
module Api
  class InvoicesController < ApplicationController
    
    skip_before_filter :verify_authenticity_token
    before_filter :set_gateway
    def set_gateway  
      @gateway = XeroGateway::Gateway.new('QCH8UE8M45XRGM6SX90SOH4J8VDX6E', 'WRLSBHUJGLYUPKMXXZLGJ6T2KFINZL')

      %x(open #{@gateway.request_token.authorize_url})

      puts "Enter the verification code from Xero?"
      oauth_verifier = gets.chomp  

      @gateway.authorize_from_request(@gateway.request_token.token, @gateway.request_token.secret, :oauth_verifier => oauth_verifier)
      # session[:xero_auth] = { :access_token  => @gateway.access_token.token,:access_secret => @gateway.access_token.secret }
      
      
      puts "Access token is valid for 30 minutes"
      puts "++++++++++++++++++++++++++++++++++++++++"  



    #  token = @gateway.request_token
     # token.authorize_url
     # binding.pry
     # session[:xero_auth] = { :access_token  => @gateway.access_token.token,:access_secret => @gateway.access_token.secret }
    # user apparenly returns the oauth verification token passed as a param as below:
      # @gateway.authorize_from_request(token.token, token.secret, oauth_verifier: "3346996")
    #
    #   Which is the same as below:
    #@gateway.authorize_from_request(token.token, token.secret, oauth_verifier: "5441267")
    end

    def index
      invoices = @gateway.get_invoices.invoices
      render :json => invoices
    end

    def monies_due
      invoices = @gateway.get_invoices.invoices.collect{|inv| inv.amount_due}
      render :json => invoices
    end
  end
end