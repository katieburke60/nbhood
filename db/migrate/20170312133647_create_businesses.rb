class CreateBusinesses < ActiveRecord::Migration[5.0]
  def change
    create_table :businesses do |t|
      t.string :name
      t.string :about
      t.string :phone
      t.string :neighborhood
    end
  end
end
