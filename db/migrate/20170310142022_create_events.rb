class CreateEvents < ActiveRecord::Migration[5.0]
  def change
    create_table :events do |t|
      t.datetime :datetime
      t.string :name
      t.text :description
      t.string :location
      t.integer :price
      t.string :price_description
      t.integer :capacity
    end
  end
end
