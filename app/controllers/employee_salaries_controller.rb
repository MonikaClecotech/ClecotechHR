class EmployeeSalariesController < ApplicationController
before_action :check_role

  def new
    @salary_transaction = SalaryTransaction.last
    @employee_salary = @salary_transaction.employee_salaries.new
  end 

  def create
    @salary_transaction = SalaryTransaction.last
    @employee_salary = @salary_transaction.employee_salaries.new(employee_salary_params)
    if @employee_salary.save
      flash[:success] = "Successfully created"
      redirect_back fallback_location: request.referer
    else
      redirect_back fallback_location: request.referer
    end
  end

  def generate
    @salary_transaction = SalaryTransaction.create(:user_id => current_user.id, :salary_date => Time.now, :organization_id => Organization.first.id)

    @salary_to_be_paid = 0

      EmployeeSalary.where(created_at: Time.zone.now.beginning_of_month..Time.zone.now.end_of_month).each do |salary|
        @salary_to_be_paid += salary.try(:salary_amount).to_i
        salary.update(:salary_transaction_id => @salary_transaction.id)
      end

    @salary_transaction.update(:salary => @salary_to_be_paid)

    redirect_to root_path
  end

private

 def employee_salary_params
   params.require(:employee_salary).permit(:salary_amount, :user_id, :salary_transaction_id)
 end

 def check_role
   redirect_to root_path unless current_user.has_role? :admin 
 end

end
