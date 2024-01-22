class AddCategoryAndInfoToBooks < ActiveRecord::Migration[7.1]
  def change
    add_column :books, :category, :string
    add_column :books, :info, :text
  end
end
