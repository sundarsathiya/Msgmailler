class FixColumnName < ActiveRecord::Migration
  def change
  	rename_column :messages, :message, :body
  	add_column :messages, :status, :string
  end
end
