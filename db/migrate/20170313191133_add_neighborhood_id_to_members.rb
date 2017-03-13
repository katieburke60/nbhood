class AddNeighborhoodIdToMembers < ActiveRecord::Migration[5.0]
  def change
    add_reference :members, :neighborhood, foreign_key: true
  end
end
