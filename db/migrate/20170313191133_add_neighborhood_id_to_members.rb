class AddNeighborhoodIdToMembers < ActiveRecord::Migration[5.0]
  def change
    add_reference :neighborhoods, :members, foreign_key: true
  end
end
