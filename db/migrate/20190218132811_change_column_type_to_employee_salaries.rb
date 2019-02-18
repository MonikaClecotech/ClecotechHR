class ChangeColumnTypeToEmployeeSalaries < ActiveRecord::Migration[5.2]
  def change
    change_column :employee_salaries, :salary_amount, 'bigint USING CAST(salary_amount AS bigint)'
  end
end
