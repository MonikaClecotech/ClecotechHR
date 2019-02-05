class AddBankToAccounts < ActiveRecord::Migration[5.2]
  def change
    add_column :accounts, :bank, :boolean, :default => false  
  end
end
