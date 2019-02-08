class AddFieldsToSalaryTransactions < ActiveRecord::Migration[5.2]
  def change
    add_column :salary_transactions, :salary_date, :date
    add_column :salary_transactions, :company_transaction_id, :integer
  end
end
