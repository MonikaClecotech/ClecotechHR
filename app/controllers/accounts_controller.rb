class AccountsController < ApplicationController
  
  def new
  end

  def create
    if current_user.has_role? (:HR)
      @account = Account.new(account_params)
      @account.user_id = current_user.id
      if @account.save
        redirect_to root_path
      else
        redirect_to root_path
      end
    else
      flash[:success] = "Sorry you are not authorize to access this portal"
      redirect_to root_path
    end
  end

  def index
    if current_user.has_role? (:employee)
      flash[:success] = "Sorry you are not authorize to access this portal"
      redirect_to root_path
    end
  end

private

  def account_params
    params.require(:account).permit(:account_no ,:ifsc ,:bank ,:user_id)
  end

end
