class SalaryTransactionsController < ApplicationController

def generate
  employee_data = ""
  salary_to_be_paid = 0
  User.all.each do |user|
    employee_data += "MCW|#{user.account.account_no}|0011|#{user.name}|#{user.employee_salary.try(:salary_amount)}|INR|January 19 Salary|#{user.account.ifsc}|WIB^"+"\n"
    salary_to_be_paid += user.employee_salary.try(:salary_amount).to_i
   end
  employer_data = "FHR|19|02/01/2019|Cut-off|#{salary_to_be_paid}|INR|024105005404|0011^"+"\n"
  employer_data += "MDR|024105005404|0011|CLECOTEC06062017|#{salary_to_be_paid}|INR|Salary Jan 2019|ICIC0000011|WIB^"+"\n"
  send_data employer_data + employee_data, :filename => "#{Time.now.to_s}.txt"
end

 def index
 end

def new
  @organization = Organization.find(params[:organization_id])
  @salary_transaction = @organization.salary_transactions.new
end

def create
  @organization = Organization.find(params[:organization_id])
  @salary_transaction = @organization.salary_transactions.new(salary_transaction_params)
  if @salary_transaction.save
    redirect_back fallback_location: request.referer
  else
    redirect_back fallback_location: request.referer
  end
end 

private

 def salary_transaction_params
  params.require(:salary_transaction).permit(:salary, :organization_id, :user_id)
 end

end
