class UsersController < ApplicationController
  before_action :set_user, only: %i[ show edit update destroy ]
    def new
      @user = User.new
    end
   
    def show
    end
    def create
        @user = User.new(user_params)
        if @user.save
          redirect_to user_path(@user.id)
        else
          render :new
      end
    end
      def edit
      end

      def update
          if @user.update(user_params)
              redirect_to user_path(@user.id)
          else
              render :edit
          end
      end
     private
    def set_user
      @user = User.find(params[:id])
    end

    def user_params
      params.require(:user).permit(:name, :email, :password,
                                   :password_confirmation)
    end
  end