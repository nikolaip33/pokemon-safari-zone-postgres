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

    def current_user
      @current_user ||= Trainer.find_by(id: session[:user_id]) if session[:user_id]
    end

    def login(user)
      session[:user_id] = user.id
    end

    def logout
      session.clear
      redirect "/sign-in"
    end

  end

end

def paginate(n)
  offset = (n.to_i-1)*20
  limit = offset == 780 ? 21 : 20
  "?limit=#{limit}&offset=#{offset}"
end

def img_index(n)
  if n.to_i < 10
      "00#{n}"
  elsif n.to_i < 100
      "0#{n}"
  else
      n.to_s
  end
end