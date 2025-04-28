class CreateItems < ActiveRecord::Migration[7.1]
  def change
    create_table :items do |t|
      t.string :name
      t.text :description
      t.integer :price
      t.references :user, null: false, foreign_key: true
      t.integer :category_id,              null: false
      t.integer :status_id,                null: false
      t.integer :shipping_fee_status_id,   null: false
      t.integer :prefecture_id,            null: false
      t.integer :scheduled_delivery_id,    null: false
      
      t.timestamps
    end
  end
end
