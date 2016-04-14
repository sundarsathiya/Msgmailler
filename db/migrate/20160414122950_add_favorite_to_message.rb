class AddFavoriteToMessage < ActiveRecord::Migration
  def change
    add_column :messages, :favorite, :string
  end
end
