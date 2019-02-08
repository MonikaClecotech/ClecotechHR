class AddColumnsToSalaryTransaction < ActiveRecord::Migration[5.2]
  def change
    add_column :salary_transactions, :account_no, :string
    add_column :salary_transactions, :ifsc, :string
  end
end
