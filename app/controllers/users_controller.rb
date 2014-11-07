class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.create(user_params)
    if @user.save
      warden.set_user(@user)
      redirect_to root_url, notice: "Bienvenido a MusicTraders!"
    else
      render "new"
    end
  end

  def update
    #user = User.find(params[:id])
    #user = User.update_attributes!(user_params)
    #redirect_to user
  end

  private

  def user_params
    params.require(:user).permit(:email, :password, :password_digest)
  end
end
