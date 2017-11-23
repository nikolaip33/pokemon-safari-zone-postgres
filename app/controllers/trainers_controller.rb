class TrainersController < ApplicationController
    
    get '/trainers' do
        @trainers = Trainer.order(:username)
        erb :"/trainers/page"
    end
    
    get '/trainers/:id/edit' do
        if logged_in? && current_user == Trainer.find_by(id: params[:id])
            @trainer = current_user
            erb :"/trainers/edit"
        else
            flash[:danger] = "Failure! Your are not authorized to edit this account."
            redirect "/trainers/#{params[:id]}"
        end
    end

    get '/trainers/:id' do
        if @trainer = Trainer.find_by(id: params[:id])
            @pokemon = @trainer.pokemon
            if logged_in? && current_user == @trainer
                if @pokemon.length == 0
                    erb :"/trainers/show_new"
                else
                    erb :"/trainers/show_owner"
                end
            else
                erb :"/trainers/show"
            end
        else
            flash[:danger] = "Failure! No record found for this trainer."
            redirect "/trainers"
        end
    end

    patch '/trainers/:id' do
        if logged_in?
            if current_user == Trainer.find_by(id: params[:id])
                if current_user.update(params[:t].reject{|k, v| v.blank?})
                    flash[:success] = "Success! Your information has been updated."
                    redirect "/trainers/#{current_user.id}/edit"
                else
                    flash[:danger] = "Failure! #{current_user.errors.full_messages.join(", ") if current_user.errors.any?}."
                    redirect "/trainers/#{current_user.id}/edit"
                end
            else
                flash[:danger] = "Failure! Your are not authorized to edit this account."
                redirect "/trainers/#{current_user.id}"
            end
        else
            flash[:danger] = "Failure! Your are not authorized to edit this account."
            redirect "/trainers"
        end
    end

    delete '/trainers/:id' do
        if logged_in? && current_user == Trainer.find_by(id: params[:id])
            flash[:success] = "Success! Your account was deleted and #{current_user.pokemon.count} pokémon were released."
            current_user.destroy
            redirect "/"
        elsif logged_in?
            flash[:danger] = "Failure! Your are not authorized to delete this account."
            redirect "/trainers/#{current_user.id}"
        else
            flash[:danger] = "Failure! Your are not authorized to delete this account."
            redirect "/sign-in"
        end
    end
    
end