class CreateComments < ActiveRecord::Migration[5.0]
  def change
    create_table :comments do |t|
      t.string :content
      t.integer :micropost_id

      t.timestamps
    end
    add_index :comments, :micropost_id
  end
end
