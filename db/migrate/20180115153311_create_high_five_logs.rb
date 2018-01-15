class CreateHighFiveLogs < ActiveRecord::Migration[5.1]
  def change
    create_table :high_five_logs do |t|
      t.integer :user_from
      t.integer :user_to
      t.integer :count

      t.timestamps
    end
  end
end
