class AddPrboardToUsers < ActiveRecord::Migration
  def change
    add_column :users, :prboard, :hstore
  end
end
