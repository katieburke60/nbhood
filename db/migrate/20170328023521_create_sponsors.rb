class CreateSponsors < ActiveRecord::Migration[5.0]
  def change
    create_table :sponsors do |t|
      t.integer :bill_id
      t.integer :representative_id

      t.timestamps
    end
  end
end
