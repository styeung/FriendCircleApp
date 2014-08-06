class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.string :body, null: false
      t.integer :commenter_id, null: false
      t.integer :post_id, null: false
      t.timestamps
    end

    add_index :comments, :commenter_id
    add_index :comments, :post_id
  end
end
