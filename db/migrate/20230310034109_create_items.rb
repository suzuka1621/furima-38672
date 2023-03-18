class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string :item
      t.text :introduction
      t.integer :price
      t.integer :category_id
      t.integer :item_status_id
      t.integer :delivery_cost_id
      t.integer :prefecture_id
      t.integer :delivery_day_id
      t.references :user_id
      t.timestamps
    end
  end
end
