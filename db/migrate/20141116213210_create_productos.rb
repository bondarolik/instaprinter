class CreateProductos < ActiveRecord::Migration
  def change
    create_table :productos do |t|
      t.string :title
      t.string :slug
      t.text  :description
      t.timestamps
    end
  end
end
