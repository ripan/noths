class CreateMiscPromotionalRules < ActiveRecord::Migration
  def change
    create_table :misc_promotional_rules do |t|
      t.string :name
      t.decimal :discount_percentage, :precision => 8, :scale => 2
      t.decimal :discount_price, :precision => 8, :scale => 2

      t.timestamps null: false
    end
  end
end
