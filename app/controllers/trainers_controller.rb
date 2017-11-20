class TrainersController < ApplicationController
    
    get '/trainers' do
        @trainers = Trainer.all
        erb :"/trainers/page"
    end
    
    get '/trainers/:id/edit' do
        @trainer = current_user
        erb :"/trainers/edit"
    end

    get '/trainers/:id' do
        if @trainer = Trainer.find_by(id: params[:id])
            
            if logged_in? && current_user == @trainer
                if @trainer.pokemon.length == 0
                    erb :"/trainers/show_new"
                else
                    erb :"/trainers/show_owner"
                end
            else
                erb :"/trainers/show"
            end
        else
            redirect "/trainers"
        end
    end

    patch '/trainers/:id' do
        if logged_in?
            if current_user == Trainer.find_by(id: params[:id])
                @trainer = current_user
                @trainer.update(username: params[:username]) unless params[:username].blank?
                @trainer.update(email: params[:email]) unless params[:email].blank?
                @trainer.update_attribute(:password, params[:password]) unless params[:password].blank?
                @trainer.update_attribute(:first_name, params[:first_name]) unless params[:first_name].blank?
                @trainer.update_attribute(:last_name, params[:last_name]) unless params[:last_name].blank?
                @trainer.update_attribute(:age, params[:age]) unless params[:age].blank?
                
                redirect "/trainers/#{@trainer.id}/edit"
            else
                redirect "/trainers/#{current_user.id}"
            end
        else
            redirect "/trainers"
        end
    end

    delete '/trainers/:id' do
        
    end
    
end