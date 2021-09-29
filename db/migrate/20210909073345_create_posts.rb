class CreatePosts < ActiveRecord::Migration[5.2]
  def change
    create_table :posts do |t|

      t.integer :user_id,  null: false
      t.integer :area_id,  null: false
      t.string :shop_name, null: false
      t.string :image_id
      t.text :body
      t.string :location
      t.timestamps
    end
  end
end
