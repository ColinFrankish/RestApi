class CreateTransactions < ActiveRecord::Migration
  def change
    create_table :transactions do |t|
      t.string :name
      t.integer :cost
      t.integer :wheels

      t.timestamps null: false
    end
  end
end
