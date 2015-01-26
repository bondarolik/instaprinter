class CreateBanners < ActiveRecord::Migration
  def change
    create_table :banners do |t|
      t.string :title
      t.text  :description
      t.timestamps
    end
  end
end
