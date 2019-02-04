class Organization < ApplicationRecord
  has_many :users, dependent: :destroy
  has_many :salary_transactions
end
