class CreateUpvotes < ActiveRecord::Migration
  def change
    create_table :upvotes do |t|
      t.integer :post_id, null: false
      t.integer :user_id, null: false

      t.timestamps
    end

    add_index :upvotes, :post_id
    add_index :upvotes, :user_id
  end
end
