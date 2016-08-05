class CreatePromotionalRules < ActiveRecord::Migration
  def change
    create_table :promotional_rules do |t|
      t.integer :product_id
      t.integer :quantity
      t.decimal :discount_percentage, :precision => 8, :scale => 2
      t.decimal :discount_price, :precision => 8, :scale => 2

      t.timestamps null: false
    end
  end
end
