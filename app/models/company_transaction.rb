class CompanyTransaction < ApplicationRecord
  has_many :salary_transactions, dependent: :destroy 
  belongs_to :organization
end
