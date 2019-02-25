class SalaryTransactionsPdf < Prawn::Document
  def initialize(users)
    super()
    @users = User.order("id ASC").all
    user_id
  end

  def user_id
   text "FHR|19|02/01/2019|Cut-off|TOTAL_SALARY_TO_BE_PAID|INR|024105005404|0011^

   MDR|024105005404|0011|CLECOTEC06062017|SALARY_OF_EMPLOYEE|INR|Salary Jan 2019|ICIC0000011|WIB^
   "
   @users.map do |user|
    text " MCW|#{user.account.account_no}|0011|#{user.name}|#{EmployeeSalary.find_by(user_id: user.id).try(:salary_amount)}|INR|January 19 Salary|#{user.account.ifsc}|WIB^
    "
   end
  end

end