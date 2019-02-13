class EmployeeSalary < ApplicationRecord
	belongs_to :salary_transaction, optional: true
	belongs_to :user
  validates :salary_amount, presence: true, numericality: { only_integer: true }
end
