class AddUserIdToSalaryTransactions < ActiveRecord::Migration[5.2]
  def change
    add_column :salary_transactions, :user_id, :integer
  end
end
