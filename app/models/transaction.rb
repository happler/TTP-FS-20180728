# == Schema Information
#
# Table name: transactions
#
#  id         :bigint(8)        not null, primary key
#  ticker     :string           not null
#  price      :float            not null
#  quantity   :integer          not null
#  buyer_id   :integer          not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Transaction < ApplicationRecord
    
    validates :ticker, :price, :quantity, :buyer_id, presence: true

    belongs_to :buyer,
    class_name: :User,
    foreign_key: :buyer_id

end
