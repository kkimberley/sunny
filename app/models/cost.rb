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

class Cost < ApplicationRecord
  has_many :items
end
