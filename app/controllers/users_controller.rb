class UsersController < ApplicationController
  
  def new
    @user = User.new
    @user.build_account
  end

  def create
    @user = User.create(user_params)
    if @user.save
      flash[:success] = "Successfully created"
      redirect_to users_dashboard_index_path
    else
      flash[:success] = "Error"
      render 'new'
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
     if @user.update_attributes(user_params)
      flash[:notice] = "User Updated"
      redirect_to users_dashboard_index_path
    else
      render 'edit'
    end
  end
  
  def destroy
    @user = User.find(params[:id])
    if @user.destroy
      flash[:notice] = "Employee deleted"
      redirect_back fallback_location: request.referer
    else
      redirect_back fallback_location: request.referer
    end
  end

  def show
    @user = User.find(params[:id])
  end

  private

  def user_params
    params.require(:user).permit(:name, :organization_id, :employee_id , :email, :password, :password_confirmation, :role_ids,:account_attributes => [:id, :account_no, :ifsc, :bank])
  end

end
