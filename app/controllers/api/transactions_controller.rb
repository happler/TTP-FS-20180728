class Api::TransactionsController < ApplicationController
    def create
        @transaction = current_user.transactions.new(transaction_params)
        saved_successfully? = false
        @transaction.transaction do
            stock = Stock.find_or_create_by!(id: current_user.id, ticker: transaction_params[ticker])
            stock.quantity = quantity: transaction_params[quantity] + stock.quantity
            stock.save!
            @transaction.save!
            saved_successfully? = true
        end
        if saved_successfully?
            render :create 
        else
            render json: @transaction.errors.full_messages, status: 422
        end
        
    end
end
