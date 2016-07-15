
module Api
  class InvoicesController < ApplicationController
    
    skip_before_filter :verify_authenticity_token
    before_filter :set_gateway

    def index
      render :json => invoices
    end

    def monies_due      
      monies = invoices.collect{|inv| inv.amount_due}
      render :json => monies
    end

    def contact_names
      names = invoices.collect{|inv| inv.contact.name}
      render :json => names
    end

    private

    def invoices
      @gateway.get_invoices.invoices
    end

    def set_gateway  
      @gateway = XeroGateway::Gateway.new('QCH8UE8M45XRGM6SX90SOH4J8VDX6E', 'WRLSBHUJGLYUPKMXXZLGJ6T2KFINZL')
      %x(open #{@gateway.request_token.authorize_url})
      puts "Enter the verification code from Xero:"
      oauth_verifier = gets.chomp  
      @gateway.authorize_from_request(@gateway.request_token.token, @gateway.request_token.secret, :oauth_verifier => oauth_verifier)
      puts "++++++++++++++++++++++++++++++++++++++++"  
    # token = @gateway.request_token
    # token.authorize_url
    # @gateway.authorize_from_request(token.token, token.secret, oauth_verifier: "3346996")
    # session[:xero_auth] = { :access_token  => @gateway.access_token.token,:access_secret => @gateway.access_token.secret }
    end
  end
end