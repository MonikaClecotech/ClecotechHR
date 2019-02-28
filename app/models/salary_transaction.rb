class SalaryTransaction < ApplicationRecord
	has_many :employee_salaries, dependent: :destroy
  accepts_nested_attributes_for :employee_salaries
  # has_many :company_transactions, dependent: :destroy
	belongs_to :organization
  validates_associated :employee_salaries
end
