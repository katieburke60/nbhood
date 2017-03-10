class CreateRsvps < ActiveRecord::Migration[5.0]
  def change
    create_table :rsvps do |t|
      t.references :member, foreign_key: true
      t.references :event, foreign_key: true
    end
  end
end
