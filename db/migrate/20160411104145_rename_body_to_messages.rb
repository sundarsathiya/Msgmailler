class RenameBodyToMessages < ActiveRecord::Migration
  def change
  	rename_table :bodies, :messages
  end
end
