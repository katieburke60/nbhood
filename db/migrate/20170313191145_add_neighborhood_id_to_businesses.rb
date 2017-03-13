class AddNeighborhoodIdToBusinesses < ActiveRecord::Migration[5.0]
  def change
    add_reference :neighborhoods, :businesses, foreign_key: true
  end
end
