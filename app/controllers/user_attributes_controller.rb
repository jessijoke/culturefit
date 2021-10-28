class UserAttributesController < ApplicationController
    def index
        scores = UserAttribute.all
        #scores = UserAttribute.group(:quiz_id)
        render json: scores
    end

    def unique_elements
        scores = UserAttribute.group(:quiz_id)
        render json: scores
    end

    def scores_by_quiz
        #scores = UserAttribute.group(quiz_id: params[:id])
    end

    def show
        scores = UserAttribute.where(quiz_id: params[:id])
        if (scores)
            render json: scores
        else
            render json: { message: 'Quiz not found.'}
        end
    end

    def create
        #byebug
        user = User.find_by(name: score_params[:name])
        score_params[:userScore].each do |object|
            #byebug
            newScore = UserAttribute.create(
                user_id: user.id,
                attr: object[:attr],
                quiz_id: score_params[:quizID],
                score: object[:score]
            )
            if newScore.save
                print "IT WORKED"
            else
                print "Nope"
            end
        end
        render json: user
    end

    private
    def score_params
        params.permit(
            :name,
            :quizID,
            userScore: [ 
                :attr,
                :score
             ]
        )
            
    end
end
