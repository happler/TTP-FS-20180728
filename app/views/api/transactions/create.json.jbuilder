json.transactions do
  json.set! @transaction.id do
        @transaction.extract :quantity, :ticker. :price
    end
end