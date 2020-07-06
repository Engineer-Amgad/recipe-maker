class UsersController < ApplicationController

    def new 

        @user = User.new
        
    end 

    def create

        @user = User.new
        @user.username = params[:user][:username]
        if @user.save
            redirect_to recipe_path
        else
            render 'users/new'
        end 

    end 
end
