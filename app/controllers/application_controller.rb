class ApplicationController < ActionController::Base
    helper_method :current_user, :logged_in?

    def current_user
        return User.find(session[:id])
    end

    def authenticate
       if !logged_in?
        flash[:error]= "Please Log-in"
        redirect_to login_path
       end
    end

    def logged_in?
        return false if session[:id].nil?
        true
    end

    def sanit_params_user()
        params.require(:user).permit(:username)
      end

      def redirecting
        if logged_in?
            redirect_to root_path
      end
    end
end
