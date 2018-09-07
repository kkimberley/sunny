class CreateItems < ActiveRecord::Migration[5.2]
  def change
    create_table :items do |t|
      t.string :name
      t.integer :mount
      t.integer :price
      t.integer :sum
      t.string :note
      t.integer :cost_id

      t.timestamps
    end
  end
end
