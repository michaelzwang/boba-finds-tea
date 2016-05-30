class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :cafe_name, null: false
      t.string :description
      t.string :quality
      t.string :price
      t.string :street
      t.string :city
      t.string :state
      t.integer :user_id
      t.decimal :lat, :precision => 15, :scale => 10
      t.decimal :lng, :precision => 15, :scale => 10
      t.string :image_url
      t.string :location_url
      t.string :yelp_url

      t.timestamps null:false
    end
  end
end
