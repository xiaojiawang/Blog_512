class SessionsController < ApplicationController
    skip_before_action :require_user_sign_in
    before_action :current_user

    def new
      if session[:user_id]
        current_user  
        redirect_to users_path
      else
        @session=Session.new
      end
    end

    def create
    clear_session
    if user = User.authenticated(params[:name], params[:password])
    # if User.authenticated(params[:name], params[:password])
    #   user=User.where(name: params[:name]).where(password: params[:password]).first
      session[:user_id] = user.id
      @current_user=nil
      # flash.now[:ok] = "成功"
      redirect_to users_path
    else
        # flash[:danger] = 'Invalid email/password combination' # 不完全正确
        # flash.now[:ref]="再尝试"
      render 'new'
    end
  end

  def clear_session
    session[:user_id] = nil
    @current_user=nil
  end

  def destroy
    clear_session
    render 'new'
    flash.now[:ha] = "重新登录"
  end
end
