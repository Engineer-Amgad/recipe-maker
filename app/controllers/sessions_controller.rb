class SessionsController < ApplicationController

    def new

    end 

    def create
        user = User.find_by(:username => params[:username])
        if user && user.authenticate(params[:password])
            session[:user_id] = user.id
            redirect_to recipes_path
        else 
            render 'sessions/new'
        end 
    end 

    def destroy
        reset_session
        redirect_to root_path
    end 
end

# google oauth
# 713712716236-a8bcref2tpdn9fa8ekcom3v0rpnsv8jr.apps.googleusercontent.com
# 6u7cowTB_4CI7hZjYDMfAaoV