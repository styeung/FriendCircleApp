class RemoveNullFalses < ActiveRecord::Migration
  def change
    change_column :circles, :owner_id, :integer
    change_column :circle_memberships, :circle_id, :integer
    change_column :circle_memberships, :member_id, :integer
  end
end
