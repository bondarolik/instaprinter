class UsersController < ApplicationController
  def new
    redirect_to root_path, notice: "Area protegida. Requiere login!" if current_user.nil?

    @user = User.new
  end

  def create
    redirect_to root_path, notice: "Area protegida. Requiere login!" if current_user.nil?

    @user = User.create(user_params)
    if @user.save
      warden.set_user(@user)
      redirect_to root_url, notice: "Bienvenido a MusicTraders!"
    else
      render "new"
    end
  end

  def update
    redirect_to root_path, notice: "Area protegida. Requiere login!" if current_user.nil?
    
    #user = User.find(params[:id])
    #user = User.update_attributes!(user_params)
    #redirect_to user
  end

  private

  def user_params
    params.require(:user).permit(:email, :password, :password_digest)
  end
end
