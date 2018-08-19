# == Schema Information
#
# Table name: costs
#
#  id         :bigint(8)        not null, primary key
#  category   :string
#  item       :string
#  mount      :integer
#  price      :integer
#  sum        :integer
#  note       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'test_helper'

class CostTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
