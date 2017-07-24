class ApplicationController < ActionController::Base
    before_action :require_user_sign_in
    # protect_from_forgery with: :exception

    def require_user_sign_in
        if session[:user_id]
            current_user
        else
            flash[:alert] = "你还没有登录，请先登录..."
            redirect_to sign_in_path
        end
    end

    def current_user
        @current_user =@current_user || User.find_by(id: session[:user_id])
        @current_user
    end
    

end
