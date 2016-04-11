class AddBodyToBody < ActiveRecord::Migration
  def change
    add_column :bodies, :image, :string
  end
end
