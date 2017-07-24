class UsersController < ApplicationController
  before_action :find_user, only: [:edit, :update, :show, :destory]
  skip_before_action :require_user_sign_in, only: [:new, :create]
  def new
    @user=User.new
  end

  def create
    @user=User.new(user_params)
    # @user.password = params[:password]
    if @user.save
      redirect_to users_url
    else
      render 'new'
    end
  end

  def show
  end

  def index
    @users=User.all
  end

  def edit
  end

  def update
    if @user.update_attributes(params[:user])
      redirect_to @user, notice: 'Article was successfully updated.' 
    else
      render 'edit'
    end
  end

  def destory
    if @user.destory
      # redirect_to @users
      redirect_to users_url
    end
  end
  
  private
  
  def find_user
    @user=User.find(id: params[:id]).first
  end

  def user_params
    params.require(:user).permit(:name, :password, :email, :phone, :address)
  end

end
