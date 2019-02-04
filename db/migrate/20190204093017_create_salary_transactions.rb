class CreateSalaryTransactions < ActiveRecord::Migration[5.2]
  def change
    create_table :salary_transactions do |t|
      t.decimal :salary, :precision => 16, :scale => 2
      t.integer :organization_id
      t.timestamps
    end
  end
end
