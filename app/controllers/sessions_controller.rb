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
        

        redirect "/trainers/#(@trainer.id}"
    end

    get '/signin' do
        erb :"/sessions/signin"
    end

    post '/signin' do

    end

end