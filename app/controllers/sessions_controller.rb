class SessionsController < ApplicationController
    def create
        user=User.find_by(username: params[:username])
        if user&.authenticate(params[:password])
            session[:user_id]=user.id
            render json: user, status: :created
        else
            render json: {error: "not authorized"},status: :unauthorized
        end
    end
    def destroy
        user=User.find_by(username: params[:username])
        if user != nil
        session.delete :user_id
        head :no_content
        else
            render json: {error: "not authorized"},status: :unauthorized
    end
end
end
