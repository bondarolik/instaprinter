class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  #before_action :require_login

  def product_list
    @productos_links = Producto.all.order(sort_order: :asc)
  end
  helper_method :product_list

  def banners_list
    @banners_list = Banner.all
  end
  helper_method :banners_list


private
  def current_user
    warden.user
  end
  helper_method :current_user

  def warden
    env['warden']
  end

#  def require_login
#   unless current_user.nil?
#      flash[:error] = "You must be logged in to access this section"
#      redirect_to login_url # halts request cycle
#    end
#  end
end
