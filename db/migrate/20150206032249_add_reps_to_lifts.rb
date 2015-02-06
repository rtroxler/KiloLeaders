class AddRepsToLifts < ActiveRecord::Migration
  def change
    add_column :lifts, :reps, :integer, :default => 1
  end
end
