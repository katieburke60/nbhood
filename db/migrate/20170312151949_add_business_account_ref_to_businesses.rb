class AddBusinessAccountRefToBusinesses < ActiveRecord::Migration[5.0]
  def change
    add_reference :businesses, :business_account, foreign_key: true
  end
end
