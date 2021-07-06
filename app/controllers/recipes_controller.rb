class RecipesController < ApplicationController

    def index 
        user=User.find_by(id:session[:user_id])
        if user.valid?
        recipes=user.recipes
        render json: recipes
    else
        render json: {error:"not authorized"},status: :unauthorized 
    end
end




    def create
        user=User.find_by(id:session[:user_id])
        if user.valid?
            recipe=user.recipes.create(recipes_params)
            render json: recipe status: :created
        else
            render json: {error:"not authorized"},status: :unauthorized 
    end
end
    private
    def recipes_params
        params.permit(:title,:instructions,:minutes_to_complete,:user_id)
    end
end
