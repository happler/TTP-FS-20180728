json.stocks do
    @stocks.each do |stock|
        json.set! stock.id do
            stock.extract :quantity, :ticker
        end
    end
end
