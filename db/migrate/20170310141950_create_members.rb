class CreateMembers < ActiveRecord::Migration[5.0]
  def change
    create_table :members do |t|
      t.references :account, foreign_key: true
      t.string :name
      t.string :about
      t.integer :age
      t.string :gender
      t.string :relationship_status
      t.string :phone
      t.string :hometown
    end
  end
end
