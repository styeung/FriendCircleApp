class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.text :body, null: false
      t.integer :poster_id

      t.timestamps
    end

    add_index :posts, :poster_id
  end
end
