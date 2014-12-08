class ProductosController < ApplicationController
  skip_before_action :require_login, only: [:index, :show]
  add_breadcrumb "Inicio", :root_path, :options => { :title => "Inicio" }

  def index
    @productos = Producto.all
    add_breadcrumb "Listado de productos", ''
  end

  def new
    redirect_to root_path, notice: "Area protegida. Requiere login!" if current_user.nil?

    @producto = Producto.new

    add_breadcrumb "Listado de productos", productos_path
    add_breadcrumb "Agregar nuevo producto", new_producto_path, :options => { :title => "Agregar Producto" }
  end

  def create
    redirect_to root_path, notice: "Area protegida. Requiere login!" if current_user.nil?

    #render plain: params[:productos].inspect
    @producto = Producto.new(producto_params)
   
    if @producto.save
      redirect_to @producto
    else
      render 'new'
    end     
  end

  def edit
    redirect_to root_path, notice: "Area protegida. Requiere login!" if current_user.nil?

    @producto = Producto.find(params[:id])

    add_breadcrumb "Listado de productos", productos_path
    add_breadcrumb "Redactar producto", new_producto_path, :options => { :title => "Redactar Producto" }
  end

  def update
    redirect_to root_path, notice: "Area protegida. Requiere login!" if current_user.nil?

    @producto = Producto.find(params[:id])
   
    if @producto.update(producto_params)
      redirect_to @producto
    else
      render 'edit'
    end 
  end

  def show
    @producto = Producto.find(params[:id])

    add_breadcrumb "Producto: #{@producto.title} ", producto_path(@producto.id), :options => { :title => @producto.title }
  end

  def destroy
    redirect_to root_path, notice: "Area protegida. Requiere login!" if current_user.nil?
    
    @producto = Producto.find(params[:id])
    @producto.destroy
   
    redirect_to productos_path
  end

private
  def producto_params
    params.require(:producto).permit(:title, :slug, :sort_order, :description)
  end  
end
