class SessionsController < ApplicationController

    get '/register' do
        if logged_in?
            redirect "/trainers/#{@current_user.id}"
        else
            erb :"/sessions/register"
        end
    end

    post '/register' do
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

    get '/sign-in' do
        if logged_in?
            redirect "/trainers/#{@current_user.id}"
        else
            erb :"/sessions/sign_in"
        end
    end

    post '/sign-in' do
        @trainer = Trainer.find_by(username: params[:username])
        if @trainer && @trainer.authenticate(params[:password])
            login(@trainer)
            redirect "/trainers/#{@trainer.id}"
        else
            redirect '/sign-in'
        end
    end

    get '/my-account' do
        if logged_in?
            redirect "/trainers/#{current_user.id}"
        else
            redirect "/register"
        end
    end

    get '/logout' do
        session.clear
        @current_user = nil
        redirect "/sign-in"
    end

end