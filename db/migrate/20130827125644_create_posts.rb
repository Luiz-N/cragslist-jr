class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.belongs_to :category
      t.string  :title
      t.text  :description
      t.integer :price
      t.string  :email

      t.timestamps
    end
  end
end
