require './config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
    set :session_secret, "password_security"

  end

  get "/" do
    erb :welcome
  end

  not_found do
    status 404
    erb :"oops"
  end

  helpers do
    def logged_in?
      !!current_user
    end

    def login(user)
      session[:user_id] = user.id
    end

    def current_user
      @current_user ||= Trainer.find(session[:user_id]) if session[:id]
    end

  end

end
