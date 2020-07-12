class SessionsController < ApplicationController

    def new

    end  

    def create
        if request.env["omniauth.auth"].present?
            user = User.find_or_initialize_by(username: request.env["omniauth.auth"]['info']['name'])
          if user.id.present?
            session[:user_id] = user.id
            redirect_to recipes_path
          else
            user.password = SecureRandom.hex
            user.save
            session[:user_id] = user.id
            redirect_to recipes_path
          end
        end
        
        if params[:username].present?
          user = User.find_by(:username => params[:username])
            if user && user.authenticate(params[:password])
                session[:user_id] = user.id
                redirect_to recipes_path
            else
                render 'sessions/new'
            end
        end
    end
    
    def destroy
        reset_session
        redirect_to root_path
    end
end
