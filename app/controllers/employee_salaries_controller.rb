class EmployeeSalariesController < ApplicationController

  def download
    @salary = EmployeeSalary.find(params[:id])
  end

  def show
    
  end

end
