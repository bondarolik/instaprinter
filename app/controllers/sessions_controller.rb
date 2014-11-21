class SessionsController < ApplicationController
  def new
    flash.now.alert = warden.message if warden.message.present?
  end

  def create
    warden.authenticate!
    redirect_to root_url, notice: "Hola! Estas en modo de redaccion del sitio!"
  end

  def destroy
    warden.logout
    redirect_to root_url, notice: "Que tengas buen dia! Por hoy es todo! Gracias!"
  end
end
