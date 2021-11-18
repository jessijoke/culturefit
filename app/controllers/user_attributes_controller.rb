class UserAttributesController < ApplicationController
    def index
        scores = UserAttribute.all
        #scores = UserAttribute.group(:quiz_id)
        render json: scores
    end

    def unique
        #scores = UserAttribute.group(:quiz_id)
        #scores = UserAttribute.select(:quiz_id).distinct
        #scores = UserAttribute.all
        scores = UserAttribute.select(:quiz_id)
        render json: scores
        #render json: { message: "Something went wrong." }
    end

    def show
        scores = UserAttribute.where(quiz_id: params[:id])
        scoresByQuiz = {}
        scores.each do |score|
            scoresByQuiz[score.user_id] = {
                user_id: User.find_by(id: score.user_id)
            }
        end
        scores.each do |score|
            scoresByQuiz[score.user_id][score.attr] = score.score
        end
        if (scores)
            render json: scoresByQuiz
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
