class RemoveFromToBody < ActiveRecord::Migration
  def change
    remove_column :bodies, :from, :string
  end
end
