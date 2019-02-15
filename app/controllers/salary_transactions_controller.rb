class SalaryTransactionsController < ApplicationController
 
  def new
    if current_user.has_role? (:HR)
      @organization = Organization.find(params[:organization_id])
      @salary_transaction = @organization.salary_transactions.new
      @salary_transaction.employee_salaries.build
    else
      flash[:success] = "Sorry you are not authorize to access this portal"
      redirect_to root_path
    end
  end
 
  def create
    if current_user.has_role? (:HR)
      @organization = Organization.last
      @salary_transaction = @organization.salary_transactions.create(salary_transaction_params)
      if @salary_transaction.save
        redirect_to organization_salary_transactions_path(Organization.last)
      else
        flash[:success] = "Please enter correct data"
        render 'new'
      end
    else
      flash[:success] = "Sorry you are not authorize to access this portal"
      redirect_to root_path
    end
  end

  def generate
    @salary_transaction = SalaryTransaction.find(params[:id])
    employee_data = ""
    @salary_to_be_paid = 0
    User.all.each do |user|
      if user.account.bank == true
         employee_data += "MCW|#{user.account.try(:account_no)}|0011|#{user.name}|#{@salary_transaction.employee_salaries.find_by(:user_id => user.id).salary_amount}|INR|#{Date.today.strftime("%B %d")} Salary|#{user.account.try(:ifsc)}|WIB^"+"\n"
         @salary_to_be_paid += @salary_transaction.employee_salaries.find_by(:user_id => user.id).salary_amount.to_i
      else
         employee_data += "MCO|#{user.account.try(:account_no)}|0011|#{user.name}|#{@salary_transaction.employee_salaries.find_by(:user_id => user.id).salary_amount}|INR|#{Date.today.strftime("%B %d")} Salary|NFT|#{user.account.try(:ifsc)}^"+"\n"
         @salary_to_be_paid += @salary_transaction.employee_salaries.find_by(:user_id => user.id).salary_amount.to_i
      end
    end
    employer_data = "FHR|19|02/01/2019|Cut-off|#{@salary_to_be_paid}|INR|024105005404|0011^"+"\n"
    employer_data += "MDR|024105005404|0011|CLECOTEC06062017|#{@salary_to_be_paid}|INR|Salary #{Date.today}|ICIC0000011|WIB^"+"\n"
    send_data employer_data + employee_data, :filename => "#{Time.now.to_s}.txt"
    create_transactions
  end
  
  def index
    if current_user.has_role? (:employee)
      flash[:success] = "Sorry you are not authorize to access this portal"
      redirect_to root_path
    end
  end
 
  def create_transactions
    if CompanyTransaction.last.salary_date.strftime("%m") != Date.today.strftime("%m") 
      @company_transaction = CompanyTransaction.create(:amount => @salary_to_be_paid, :salary_date => DateTime.now, :organization_id => Organization.first.id)
      @company_transaction.save 
    else
      flash[:error] = "Something went wrong"
      return false
    end
  end 

private

 def salary_transaction_params
  params.require(:salary_transaction).permit(:salary, :organization_id, :user_id, :month, :year,:employee_salaries_attributes => [:salary_amount, :user_id])
 end

end
