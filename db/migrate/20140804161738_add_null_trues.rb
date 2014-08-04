class AddNullTrues < ActiveRecord::Migration
  def change
    change_column :circles, :owner_id, :integer, null: true
    change_column :circle_memberships, :circle_id, :integer, null: true
    change_column :circle_memberships, :member_id, :integer, null: true
  end
end
