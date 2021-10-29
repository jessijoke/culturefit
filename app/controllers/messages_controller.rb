class MessagesController < ApplicationController
    def index
        messages = Message.all
        #render json: QuizSerializer.new(quizzes)
        render json: messages
    end

    def show
        message = Message.find_by(id: params[:id]).last(10)
        if (message)
            render json: message
        else
            render json: { message: 'Quiz not found.'}
        end
    end

    def create
        message = message.new(message_params)
        if message.save
            render json: message
        else
            render json: { message: "Something went wrong." }
        end
    end

    def message_params
        params.permit(:user, :message)
    end
end
