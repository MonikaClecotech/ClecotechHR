class SalaryTransactionsController < ApplicationController
  
def index
  @salary_transactions = SalaryTransaction.all
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
