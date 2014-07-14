class SessionsController < ApplicationController
  skip_before_aciton :authenticate_user!, only:[:create]

  def create
    @user = User.find_by(email: params[:user][:email])
    if @user.try(:autenticate,, params[:user][:password])
      login(@user)
      redirect_to root_path
    else
      @user = User.new
      @user.errors.add(:base, 'errors.login')
      @new_user = User.new
      render 'welcome/index'
    end
  end
end
