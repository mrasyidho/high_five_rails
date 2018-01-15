class AddHighfiveToUser < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :highfive, :integer, :default => 0
  end
end
