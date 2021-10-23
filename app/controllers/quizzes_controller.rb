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
        user = User.find_by(name: quiz_params[:username])
        quiz = Quiz.create(
            quiz_name: quiz_params[:quizTitle],
            user_id: user.id
        )
        #byebug
        if quiz.save
            quizID = quiz.id
            quiz_params[:questions].each do |qObject|
                question = Quiz_question.create(
                    question: qObject.question,
                    quiz_id: quizID
                )
            end
            render json: quiz
        else
            render json: { message: "Something went wrong." }
        end
        
    end

    private
    def quiz_params
        params.permit(
            :username,
            :quizTitle,
            :quiz,
            questions: [
                :question,
                answers: [
                    :answer,
                    :attribute
                ]
            ]
        )
    end
end

#questions: [
#    :question,
#    answers: [
#        :answer,
#        :attribute
#    ]
#]