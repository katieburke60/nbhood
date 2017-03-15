class CreateRatings < ActiveRecord::Migration[5.0]
  def change
    create_table :ratings do |t|
      t.integer :rsvp_id
      t.integer :rating
      t.string :comment
      t.boolean :complete
      t.integer :notification_id
    end
  end
end
