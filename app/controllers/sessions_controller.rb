class SessionsController < ApplicationController

    def new

    end 

    def create
        user = User.find_by(:email => params[:username])
        session[:user_id] = user.id
    end 
end
