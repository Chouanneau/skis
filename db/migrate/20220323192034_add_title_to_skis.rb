class AddTitleToSkis < ActiveRecord::Migration[6.1]
  def change
    add_column :skis, :title, :string
  end
end
