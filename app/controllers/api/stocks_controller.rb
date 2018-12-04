class Api::StocksController < ApplicationController
    
    def index
        @stocks = current_user.stocks
        render :index
    end
end