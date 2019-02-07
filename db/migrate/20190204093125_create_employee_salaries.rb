class CreateEmployeeSalaries < ActiveRecord::Migration[5.2]
  def change
    create_table :employee_salaries do |t|
      t.integer :user_id
      t.string :salary_amount

      t.timestamps
    end
  end
end
