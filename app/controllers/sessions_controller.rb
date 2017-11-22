class SessionsController < ApplicationController

    get '/register' do
        if logged_in?
            redirect "/trainers/#{@current_user.id}"
        else
            erb :"/sessions/register"
        end
    end

    post '/register' do
        params[:candy] = 5000
        params[:pokeballs] = 5
        @trainer = Trainer.create(params)
        if @trainer.valid?
            login(@trainer)
            flash[:success] = "Success! Account successfully created. Welcome to the Pokémon Safari Zone."
            redirect "/trainers/#{@trainer.id}"
        else
            flash[:danger] = "Failure! #{@trainer.errors.full_messages.join(", ") if @trainer.errors.any?}."
            redirect "/register"
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
        if @trainer = Trainer.find_by(username: params[:username])
            if @trainer && @trainer.authenticate(params[:password])
                login(@trainer)
                @trainer.add_candy
                @trainer.add_pokeballs
                redirect "/trainers/#{@trainer.id}"
            else
                flash[:danger] = "Failure! Incorrect password."
                redirect '/sign-in'
            end
        else
            flash[:danger] = "Failure! Trainer not found."
            redirect '/sign-in'
        end
    end

    get '/my-account' do
        if logged_in?
            redirect "/trainers/#{current_user.id}"
        else
            redirect "/sign-in"
        end
    end

    get '/power' do
        logout
    end

end