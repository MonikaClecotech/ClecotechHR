class CreateCompanyTransactions < ActiveRecord::Migration[5.2]
  def change
    create_table :company_transactions do |t|
      t.integer :organization_id
      t.integer :amount
      t.date :salary_date

      t.timestamps
    end
  end
end
