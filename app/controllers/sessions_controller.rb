class SessionsController < ApplicationController

    get '/register' do
        erb :"/sessions/register"
    end

    get '/signin' do
        erb :"/sessions/signin"
    end

end