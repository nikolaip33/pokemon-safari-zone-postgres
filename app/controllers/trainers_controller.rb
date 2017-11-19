class TrainersController < ApplicationController
    
    get '/trainers' do
        @trainers = Trainer.all
        erb :"/trainers/page"
    end
    
    get '/trainers/:id/edit' do

    end

    get '/trainers/:id' do
        if @trainer = Trainer.find_by(id: params[:id])
            
            if logged_in? && current_user == @trainer
                binding.pry
                erb :"/trainers/show-owner"
            else
                erb :"/trainers/show"
            end
        else
            redirect "/trainers"
        end
    end

    patch '/trainers/:id' do

    end

    delete '/trainers/:id' do
        
    end
    
end