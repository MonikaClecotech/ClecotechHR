class AddColumnsToSalaryTransactions < ActiveRecord::Migration[5.2]
  def change
    add_column :salary_transactions, :month, :integer
    add_column :salary_transactions, :year, :integer
  end
end
