class CreateProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :products do |t|
      t.string :name
      t.integer :price
      t.references :image, foreign_key: true
      t.references :colour, foreign_key: true
      t.references :category

      t.timestamps
    end
  end
end
