class SessionsController < ApplicationController

    get '/register' do
        binding.pry
        if logged_in?
            redirect "/trainers/#{@current_user.id}"
        else
            erb :"/sessions/register"
        end
    end

    post '/register' do
        binding.pry
        if Trainer.exists?(username: params[:username]) || Trainer.exists?(email: params[:email])
            redirect "/register"
        else
            @trainer = Trainer.create(params)
            if @trainer.valid?
                login(@trainer)
                redirect "/trainers/#{@trainer.id}"
            else
                redirect "/register"
            end
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