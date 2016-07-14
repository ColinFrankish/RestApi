
# class TransactionsController < ApplicationController
  
#   skip_before_filter :verify_authenticity_token



#   def index
#     transactions = Transaction.all

#     render :json => transactions.to_json, status: 200
#   end 

#   def show
#     respond_with Transaction.find(params[:id])
#   end

#   def create
#     transaction = Transaction.new(transaction_params)
#       if transaction.save
#         render json: transaction.to_json, status: 201
#       else
#         render json: transaction.errors.to_json, status: 422
#       end
#   end

#   def update
#     transaction = Transaction.find(params[:id])
#     if transaction.update(transaction_params)
#       render json: transaction.to_json, status: 200
#     else
#       render json: transaction.errors.to_json, status: 422
#     end
#   end

#   def destroy
#     transaction = Transaction.find(params[:id])
#     transaction.destroy
#     head 204
#   end

#   private
  
#   def transaction_params
#     params.require(:transaction).permit(:name, :cost)
#   end
# end
