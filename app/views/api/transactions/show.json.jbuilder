json.transactions
    @transactions.each do |transaction|
        json.set! transaction.id do
            transaction.extract :quantity, :ticker. :price
        end
    end
end
