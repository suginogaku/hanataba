class CreateTweets < ActiveRecord::Migration[6.0]
  def change
    create_table :tweets do |t|
      t.string :title, null:false
      t.text :description
      t.integer :recommended
      t.string :flower_name
      t.integer :prefecture_id
      t.string :city
      t.string :shop_name
      t.references :user, foreign_key: true
      t.timestamps
    end
  end
end