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

require 'test_helper'

class TransactionTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
