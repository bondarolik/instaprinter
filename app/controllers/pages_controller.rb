class PagesController < ApplicationController
  add_breadcrumb "home", :root_path, :options => { :title => "Inicio" }

  def inicio
  end

  def empresa
    add_breadcrumb "empresa", pages_empresa_path, :options => { :title => "Quienes Somos" }
  end

  def trabajos
  end

  def contacto
    add_breadcrumb "contacto", pages_contacto_path, :options => { :title => "Contacto" }
  end
end
