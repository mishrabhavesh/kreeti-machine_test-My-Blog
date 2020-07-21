class ApplicationController < ActionController::Base

    helper_method :current_user, :logged_in?

    def current_user
        @current_user ||=  User.find(session[:user_id]) if session[:user_id] 
    end

    def logged_in?
        !!current_user
    end

    def require_login
        if !session[:user_id]
          flash[:notice] = "YOU MUST LOGIN FIRST"
          redirect_to root_path
        end
      end
      
      def require_admin
        if logged_in? && current_user.role.role != "ADMIN"
          flash[:notice] = "ONLY ADMIN CAN PERFORM THIS"
          redirect_to root_path
        end
      end
      
end
