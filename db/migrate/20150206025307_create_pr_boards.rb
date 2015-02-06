class CreatePrBoards < ActiveRecord::Migration
  def change
    create_table :pr_boards do |t|
      t.integer :user_id

      t.timestamps
    end

    add_column :lifts, :pr_board_id, :integer
    remove_column :users, :prboard
  end
end
