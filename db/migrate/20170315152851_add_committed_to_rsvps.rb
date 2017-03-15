class AddCommittedToRsvps < ActiveRecord::Migration[5.0]
  def change
    add_column :rsvps, :committed, :boolean
  end
end
