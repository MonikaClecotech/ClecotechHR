class AddSalaryAmountToEmployeeSalaries < ActiveRecord::Migration[5.2]
  def change
    add_column :employee_salaries, :salary_amount, :integer
  end
end
