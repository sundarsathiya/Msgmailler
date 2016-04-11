class AddUserIdToBody < ActiveRecord::Migration
  def change
    add_column :bodies, :user_id, :integer
  end
end
