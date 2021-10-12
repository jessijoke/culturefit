class UsersController < ApplicationController
    skip_before_action :authorized, only: [:create, :login]

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

    def login
        @user = User.find_by(name: params[:name])

        if @user && @user.authenticate(params[:password])
            token = encode_token({user_id: @user.id})
            render json: { user: UserSerializer.new(@user), jwt: @token }
        else
            render json: {error: "Sorry, we couldn't find an account with those credentials. Please try again."}
        end
    end

    def auto_login
        render json: @user
    end

    private
    def user_params
        params.permit(:name, :password, :email, :user_type)
    end
end
