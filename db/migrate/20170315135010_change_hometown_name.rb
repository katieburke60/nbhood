class ChangeHometownName < ActiveRecord::Migration[5.0]
  def change
    rename_column :members, :hometown, :hometown_state
  end
end
