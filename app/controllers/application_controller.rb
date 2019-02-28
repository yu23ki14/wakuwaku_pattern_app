class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :set_user
  before_action :set_category
  before_action :set_excharts
  before_action :backhome
  before_action :configure_permitted_parameters, if: :devise_controller?
  
  def after_sign_in_path_for(resource)
    mypage_index_path
  end
  
  private
    def backhome
      if controller_name == "welcome" || controller_name == "registrations" || controller_name == "sessions" || controller_name == "alexa_talks" || controller_name == "passwords"
      else
        if !user_signed_in?
          redirect_to root_path, notice: 'ログインしてください。'
        end
      end
    end
    
    def set_user
      if user_signed_in?
        @user = User.find(current_user.id)
      end
    end
    
    def set_category
      @category = Category.all
    end
    
    def set_excharts
      if user_signed_in?
        @latest_excharts = @user.excharts.last(5)
      end
    end

  protected

    def configure_permitted_parameters
      added_attrs = [ :name, :locale, :email, :password, :password_confirmation, :monday_remind]
      devise_parameter_sanitizer.permit :sign_up, keys: added_attrs
      devise_parameter_sanitizer.permit :account_update, keys: added_attrs
      devise_parameter_sanitizer.permit :sign_in, keys: added_attrs
    end
end
