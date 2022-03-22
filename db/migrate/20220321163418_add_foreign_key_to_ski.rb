class AddForeignKeyToSki < ActiveRecord::Migration[6.1]
  def change
    add_reference :skis, :user, null: false, foreign_key: true
  end
end
