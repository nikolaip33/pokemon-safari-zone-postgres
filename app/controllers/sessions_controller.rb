class SessionsController < ApplicationController

    get '/register' do
        erb :"/sessions/register"
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