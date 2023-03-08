class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
    
  private

    def after_sign_in_path_for(resource)
      if resource.is_a?(Admin)
        admin_owners_path
      else
        user_path(current_user)
      end
    end

    def after_sign_out_path_for(resource)
      case resource
      when :admin   # ログアウト時はシンボルが返ってくる
        new_admin_session_path
      when :user  # ログアウト時はシンボルが返ってくる
        new_user_session_path
      end
    end
    
    protected
      def configure_sign_up_parameters
        devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
      end
end
