class AddSalaryTransactionIdToEmployeeSalaries < ActiveRecord::Migration[5.2]
  def change
    add_column :employee_salaries, :salary_transaction_id, :integer
  end
end
