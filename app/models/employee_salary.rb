class EmployeeSalary < ApplicationRecord
	belongs_to :salary_transaction
	belongs_to :user
end
