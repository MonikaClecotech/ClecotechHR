class SalaryTransaction < ApplicationRecord
	has_many :employee_salaries
	belongs_to :organization
end
