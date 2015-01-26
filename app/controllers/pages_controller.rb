class PagesController < ApplicationController
  add_breadcrumb "Inicio", :root_path, :options => { :title => "Inicio" }

  def inicio
    @banner = Banner.last
  end

  def empresa
    add_breadcrumb "Quienes Somos", pages_empresa_path, :options => { :title => "Quienes Somos" }
  end

  def trabajos
    add_breadcrumb "Nuestros Trabajos", pages_empresa_path, :options => { :title => "Quienes Somos" }
    @uploads = Upload.all
  end

  def contacto
    add_breadcrumb "Contacto", pages_contacto_path, :options => { :title => "Contacto" }
  end

  def send_mail
    name = params[:name]
    email = params[:email]
    body = params[:message]
    FeedbackMailer.feedback_email(name, email, body).deliver
    redirect_to pages_contacto_path, notice: "Hemos recibido su mensaje. En brevedad le responderemos. Muchas gracias!"  
  end
end
