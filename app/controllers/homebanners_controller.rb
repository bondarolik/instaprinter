class HomebannersController < ApplicationController
  skip_before_action :require_login, only: [:index, :show]
  add_breadcrumb "Inicio", :root_path, :options => { :title => "Inicio" }

  def index
    @banners = Banner.all
    add_breadcrumb "Listado de promociones", ''
  end

  def new
    redirect_to root_path, notice: "Area protegida. Requiere login!" if current_user.nil?

    @banner = Banner.new

    add_breadcrumb "Listado de promociones", homebanners_path
    add_breadcrumb "Agregar nueva promocion", new_homebanner_path, :options => { :title => "Agregar Promocion" }
  end

  def create
    redirect_to root_path, notice: "Area protegida. Requiere login!" if current_user.nil?

    #render plain: params[:productos].inspect
    @banner = Banner.new(promo_params)
   
    if @banner.save
      redirect_to @banner
    else
      render 'new'
    end     
  end

  def edit
    redirect_to root_path, notice: "Area protegida. Requiere login!" if current_user.nil?

    @banner = Banner.find(params[:id])

    add_breadcrumb "Listado de promociones", homebanners_path
    add_breadcrumb "Redactar promocion", new_homebanner_path, :options => { :title => "Redactar Producto" }
  end

  def update
    redirect_to root_path, notice: "Area protegida. Requiere login!" if current_user.nil?

    @banner = Banner.find(params[:id])
   
    if @banner.update(promo_params)
      redirect_to @banner
    else
      render 'edit'
    end 
  end

  def show
    @banner = Banner.find(params[:id])

    add_breadcrumb "Promocion: #{@banner.title} ", homebanner_path(@producto.id), :options => { :title => @banner.title }
  end

  def destroy
    redirect_to root_path, notice: "Area protegida. Requiere login!" if current_user.nil?
    
    @banner = Banner.find(params[:id])
    @banner.destroy
   
    redirect_to homebanners_path
  end

private
  def promo_params
    params.require(:banner).permit(:title, :description)
  end  
end
