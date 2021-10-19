class QuizzesController < ApplicationController
    
    def index
        quizzes = Quiz.all
        #render json: QuizSerializer.new(quizzes)
        render json: quizzes, include: :quiz_questions
    end

    def show
        quiz = Quiz.find_by(id: params[:id])
        if (quiz)
            #options[:include] = [:'quiz_name.quiz_questions', :'quiz_name.quiz_questions.quiz_answers']
            #render json: QuizSerializer.new(quiz, options)
            render json: quiz
        else
            render json: { message: 'Quiz not found.'}
        end
    end

    def create
        quiz = Quiz.new(quiz_params)
        if quiz.save
            #render json: QuizSerializer.new(quiz)
            render json: quiz
        else
            render json: { message: "Something went wrong." }
        end
    end

    private
    def quiz_params
        params.require(:quiz).permit(:quiz_name, :user_id)
    end
end
