class UsersController < ApplicationController
    skip_before_action :authorized, only: [:create]
    #before_action :authenticate_user!

    def index
        users = User.all
        render json: UserSerializer.new(users)
    end

    def show
        user = User.find_by(id: params[:id])
        if (user)
            render json: UserSerializer.new(user)
        else
            render json: { message: 'User not found.'}
        end
    end

    def create
        @user = User.create(user_params)
        if @user.valid?
          @token = encode_token(user_id: @user.id)
          render json: { user: UserSerializer.new(@user), jwt: @token }, status: :created
        else
          render json: { error: 'failed to create user' }, status: :not_acceptable
        end
      end

    private
    def user_params
        params.require(:user).permit(:name, :password_digest, :email, :user_type)
    end
end
