class SalaryTransaction < ApplicationRecord
	has_many :employee_salaries, dependent: :destroy
  has_many :company_transactions, dependent: :destroy
	belongs_to :organization
end
