class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.text :items_name,                  null: false
      t.text :items_description,           null: false
      t.integer :category_id,              null: false
      t.integer :items_condition_id,       null: false
      t.integer :shipping_fee_burden_id,   null: false
      t.integer :shiooing_region_id,       null: false
      t.integer :days_until_shipping_id,   null: false
      t.integer :selling_price,            null: false
      t.references :user,                  null: false, foreign_key:true

      t.timestamps
    end
  end
end
