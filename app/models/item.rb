class Item < ApplicationRecord
  belongs_to :cost
  attr_accessor :cost_id
end
