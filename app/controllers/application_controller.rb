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

  helpers do
    def logged_in?

    end

    def current_user

    end
  end

end
