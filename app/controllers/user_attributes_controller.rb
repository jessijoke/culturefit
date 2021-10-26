class UserAttributesController < ApplicationController
    def index
        scores = UserAttribute.all
        render json: scores
    end

    def show
        scores = UserAttribute.find_by(id: params[:id])
        if (scores)
            render json: scores
        else
            render json: { message: 'Quiz not found.'}
        end
    end

    def create
        
        user = User.find_by(name: score_params[:name])
        score_params[:userscore].each do |object|
            #byebug
            newScore = UserAttribute.create(
                user_id: user.id,
                attr: object[:attr],
                quiz_id: score_params[:quizID],
                score: object[:score]
            )
            newScore.save!
        end
        render json: user
    end

    private
    def score_params
        params.permit(
            :name,
            :quizID,
            userscore: [ 
                :attr,
                :score
             ]
        )
            
    end
end
