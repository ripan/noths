class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :code
      t.string :name
      t.text :description
      t.decimal :price, :precision => 8, :scale => 2

      t.timestamps null: false
    end
    add_index :products, :code
    add_index :products, :name
  end
end
