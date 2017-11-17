class SessionsController < ApplicationController

    get '/register' do
        if logged_in?
            redirect "/trainers/#{@current_user.id}"
        else
            erb :"/sessions/register"
        end
    end

    post '/register' do
        binding.pry
        if params[:username].empty? || if params[:username].empty? || if params[:username].empty?
            redirect "/register"
        elsif Trainer.find_by(username: params[:username]) || Trainer.find_by(email: params[:email])
            redirect "/register"
        else
            @trainer = Trainer.create(params)
            login(@trainer)
            redirect "/trainers/#{@trainer.id}"
        end
    end

    get '/signin' do
        if logged_in?
            redirect "/trainers/#{@current_user.id}"
        else
            erb :"/sessions/signin"
        end
    end

    post '/signin' do

    end

end