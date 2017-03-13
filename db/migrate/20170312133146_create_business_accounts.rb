class CreateBusinessAccounts < ActiveRecord::Migration[5.0]
  def change
    create_table :business_accounts do |t|
      t.string :email
      t.string :password_digest
    end
  end
end
