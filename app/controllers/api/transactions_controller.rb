class Api::TransactionsController < ApplicationController
    include HTTParty

    def show
        @transactions = current_user.transactions
        render :show
    end

    def create
        price = HTTParty.get("https://api.iextrading.com/1.0/stock/#{transaction_params[ticker]}/price")
        if price == "Unknown symbol" do
            render(json: ["#{transaction_params[ticker]} is not a valid stock symbol"], status: 401) and return
        end
        unless current_user.enough_funds?(price, transaction_params[quantity]) do
            # stretch goal, add logic for error to include the maximum number of shares the user can purchase
            render(json: ["sorry, you don't have the funds for that!"], status: 401) and return
        end
        @transaction = current_user.transactions.new(transaction_params)
        @transaction.price = price
        saved_successfully? = @transaction.transaction do
            stock = Stock.find_or_create_by!(id: current_user.id, ticker: transaction_params[ticker])
            stock.quantity = quantity: transaction_params[quantity] + stock.quantity
            stock.save!
            @transaction.save!
        end
        if saved_successfully?
            render :create 
        else
            render json: @transaction.errors.full_messages, status: 422
        end
        
    end

    def transaction_params
        params.require(:transaction).permit(:ticker, :quantity)
    end
end
