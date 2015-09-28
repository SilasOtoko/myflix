class RenameCategoryName < ActiveRecord::Migration
  def change
    rename_column :categories, :category_name, :name
  end
end
