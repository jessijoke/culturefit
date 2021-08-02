class UsersController < ApplicationController
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
        user = User.new(user_params)
        if user.save
            render json: UserSerializer.new(user)
        else
            render json: { message: "Something went wrong." }
        end
    end

    private
    def user_params
        params.require(:user).permit(:name, :password_digest, :email, :user_type)
    end
end
