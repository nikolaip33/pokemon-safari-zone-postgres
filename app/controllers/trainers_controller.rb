class TrainersController < ApplicationController
    
    get '/trainers' do

    end
    
    get '/trainers/:id/edit' do

    end

    get '/trainers/:id' do
        if logged_in? && current_user.id == params[:id]
            @trainer = current_user
            erb :"/trainers/show"
        else
            redirect "/sign-in"
        end
    end

    post '/trainers/:id' do

    end

    patch '/trainers/:id' do

    end

    delete '/trainers/:id' do
        
    end
    
end