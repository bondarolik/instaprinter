class PagesController < ApplicationController
  add_breadcrumb "Inicio", :root_path, :options => { :title => "Inicio" }

  def inicio
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
end
