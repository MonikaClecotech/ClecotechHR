class EmployeeSalariesController < ApplicationController

  def index
    @employee_salaries = EmployeeSalary.all
  end
  
  def download
    @salary = EmployeeSalary.find(params[:id])
  end

end
