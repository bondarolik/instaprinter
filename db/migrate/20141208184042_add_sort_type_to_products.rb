class AddSortTypeToProducts < ActiveRecord::Migration
  def change
    add_column :productos, :sort_order, :string
  end
end
