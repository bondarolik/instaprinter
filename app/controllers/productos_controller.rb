class ProductosController < ApplicationController
  skip_before_action :require_login, only: [:index, :show]
  add_breadcrumb "home", :root_path, :options => { :title => "Inicio" }

  def index
    @productos = Producto.all
  end

  def new
    @producto = Producto.new
  end

  def create
    #render plain: params[:productos].inspect
    @producto = Producto.new(producto_params)
   
    if @producto.save
      redirect_to @producto
    else
      render 'new'
    end     
  end

  def edit
    @producto = Producto.find(params[:id])  
  end

  def update
    @producto = Producto.find(params[:id])
   
    if @producto.update(producto_params)
      redirect_to @producto
    else
      render 'edit'
    end 
  end

  def show
    @producto = Producto.find(params[:id])
    #@productos_links = Producto.all

    add_breadcrumb "show", producto_path, :options => { :title => @producto.title }
  end

  def destroy
    @producto = Producto.find(params[:id])
    @producto.destroy
   
    redirect_to productos_path
  end

private
  def producto_params
    params.require(:producto).permit(:title, :slug, :description)
  end  
end
