class CreateBodies < ActiveRecord::Migration
  def change
    create_table :bodies do |t|
      t.string :to
      t.string :from
      t.string :message
      t.integer :image

      t.timestamps null: false
    end
  end
end
