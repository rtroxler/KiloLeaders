class CreateLifts < ActiveRecord::Migration
  def change
    create_table :lifts do |t|
      t.string :name
      t.integer :weight
      t.integer :user_id

      t.timestamps
    end
    add_index :lifts, [:user_id, :created_at]
  end
end
