module Api
  class InvoicesController < ApplicationController
    
    skip_before_filter :verify_authenticity_token

    def index
      invoices = []
      render :json => invoices
    end
  end
end