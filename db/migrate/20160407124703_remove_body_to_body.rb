class RemoveBodyToBody < ActiveRecord::Migration
  def change
    remove_column :bodies, :image, :integer
  end
end
