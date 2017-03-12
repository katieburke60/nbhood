class CreateMembersFollowBusinesses < ActiveRecord::Migration[5.0]
  def change
    create_table :members_follow_businesses do |t|
      t.integer :member_id
      t.integer :business_id
    end
  end
end
