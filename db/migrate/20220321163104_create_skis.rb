class CreateSkis < ActiveRecord::Migration[6.1]
  def change
    create_table :skis do |t|
      t.string :brand
      t.string :category
      t.integer :sizing
      t.boolean :availability
      t.text :description
      t.float :price

      t.timestamps
    end
  end
end
