class QuizzesController < ApplicationController
    
    def index
        quizzes = Quiz.all
        #render json: QuizSerializer.new(quizzes)
        render json: quizzes, include: :quiz_questions
    end

    def show
        quiz = Quiz.find_by(id: params[:id])
        if (quiz)
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
        if quiz.save
            quizID = quiz.id
            quizData = quiz_params[:questions]
            quizData.each do |qObject|
                nquestion = QuizQuestion.create(
                    question: qObject[:question],
                    quiz_id: quizID
                )
                if nquestion.save
                    questionID = nquestion.id
                    qObject[:answers].each do |qAnswer|
                        nanswer = QuizAnswer.create(
                            answer: qAnswer[:answer],
                            quiz_question_id: questionID
                        )
                        if nanswer.save
                            answerID = nanswer.id
                            nattribute = AnswerAttribute.create(
                                answer_attribute: qAnswer[:attribute],
                                quiz_answer_id: answerID
                            )
                        end
                    end
                end
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
