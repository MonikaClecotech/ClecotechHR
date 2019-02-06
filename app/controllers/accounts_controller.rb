class AccountsController < ApplicationController
  def new
  end

  def create
    @account = Account.new(account_params)
    @account.user_id = current_user.id
    if @account.save
      redirect_to root_path
    else
      redirect_to root_path
    end
  end

private

  def account_params
    params.require(:account).permit(:account_no ,:ifsc ,:bank ,:user_id)
  end

end
