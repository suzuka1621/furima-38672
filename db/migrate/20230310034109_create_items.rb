class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string :item,                null: false
      t.text :introduction,          null: false
      t.integer :price,              null: false
      t.integer :category_id,        null: false
      t.integer :item_state_id,      null: false
      t.integer :delivery_cost_id,   null: false
      t.integer :prefecture_id,      null: false
      t.integer :delivery_day_id,    null: false
      t.references :user,            null: false, foreign_key: true
      t.timestamps
    end
  end
end
