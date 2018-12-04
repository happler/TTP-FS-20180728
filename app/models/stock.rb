class Stock < ApplicationRecord
    validates :ticker, :quantity, :buyer_id, presence: true

    belongs_to :buyer,
    class_name: :User,
    foreign_key: :buyer_id

end
