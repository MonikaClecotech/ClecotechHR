class SalaryTransactionsController < ApplicationController

  def generate
    employee_data = ""
    @salary_to_be_paid = 0
    User.all.each do |user|
      employee_data += "MCW|#{user.account.account_no}|0011|#{user.name}|#{user.employee_salary.try(:salary_amount)}|INR|January 19 Salary|#{user.account.ifsc}|WIB^"+"\n"
      @salary_to_be_paid += user.employee_salary.try(:salary_amount).to_i
    end
    employer_data = "FHR|19|02/01/2019|Cut-off|#{@salary_to_be_paid}|INR|024105005404|0011^"+"\n"
    employer_data += "MDR|024105005404|0011|CLECOTEC06062017|#{@salary_to_be_paid}|INR|Salary Jan 2019|ICIC0000011|WIB^"+"\n"
    send_data employer_data + employee_data, :filename => "#{Time.now.to_s}.txt"
    create_transactions
  end
  
  def index
  end

  def create_transactions
    if CompanyTransaction.last.salary_date.strftime("%m") != Date.today.strftime("%m") 
      @company_transaction = CompanyTransaction.create(:amount => @salary_to_be_paid, :salary_date => DateTime.now, :organization_id => Organization.first.id)
      @company_transaction.save

      User.all.each do |user|
        @salary_transaction = @company_transaction.salary_transactions.create(:salary => user.employee_salary.try(:salary_amount), :user_id => user.id, :account_no => user.account.account_no, :ifsc => user.account.ifsc, :organization_id => Organization.first.id)
      end  
    else
      flash[:error] = "No remaining Resume access limit left...Purchase our plan to start accessing cvs/resumes"
      return false
    end
  end 

private

 def salary_transaction_params
  params.require(:salary_transaction).permit(:salary, :organization_id, :user_id, :account_no, :ifsc, :company_transaction_id)
 end

end
