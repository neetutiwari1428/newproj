class CreateCategories < ActiveRecord::Migration[5.2]
  def change
    create_table :categories do |t|
      t.string :first_name
      t.string :last_name
      t.references :product
      
      t.timestamps
    end
  end
end
