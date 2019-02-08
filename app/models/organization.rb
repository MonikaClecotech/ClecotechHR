class Organization < ApplicationRecord
  has_many :users, dependent: :destroy
  has_many :salary_transactions, dependent: :destroy
  has_many :company_transactions, dependent: :destroy
end
