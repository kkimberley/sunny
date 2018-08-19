class CreateCosts < ActiveRecord::Migration[5.2]
  def change
    create_table :costs do |t|
      t.string :category
      t.string :item
      t.integer :mount
      t.integer :price
      t.integer :sum
      t.string :note

      t.timestamps
    end
  end
end
