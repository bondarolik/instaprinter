class ProductosController < ApplicationController
  skip_before_action :require_login, only: [:index, :show]
  add_breadcrumb "Inicio", :root_path, :options => { :title => "Inicio" }

  def index
    @productos = Producto.all
    add_breadcrumb "Listado de productos", ''
  end

  def new
    @producto = Producto.new

    add_breadcrumb "Agregar nuevo producto", ''
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

    add_breadcrumb "Redactar ", '', :options => { :title => @producto.title }
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

    add_breadcrumb "Producto: ", producto_path(@producto.id), :options => { :title => @producto.title }
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
