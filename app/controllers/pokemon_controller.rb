class PokemonController < ApplicationController

    get '/pokemon/:id/edit' do
        if logged_in?
            if @pokemon = current_user.pokemon.find_by(id: params[:id])
                @base = PokemonBase.find_by(id: @pokemon.pokedex_number)
                @trainer = current_user
                erb :"pokemon/edit"
            else
                flash[:danger] = "Failure! Your are not the trainer for this pokémon."
                redirect "/pokemon/#{:id}"
            end
        else
            flash[:danger] = "Failure! You are not logged in."
            redirect "/sign-in"
        end
    end

    get '/pokemon/:id' do
        if @pokemon = Pokemon.find_by(id: params[:id])
            if logged_in? && current_user.pokemon.find_by(id: params[:id])
                @trainer = current_user
                erb :"pokemon/show_owner"
            else
                @trainer = @pokemon.trainer
                erb :"pokemon/show"
            end
        else
            flash[:danger] = "Failure! No record found for this pokémon."
            redirect "/trainers"
        end
    end

    patch '/pokemon/:id' do
        if logged_in?
            if @pokemon = current_user.pokemon.find_by(id: params[:id])
                if @pokemon.valid_edit?(params[:p], current_user)
                    new_candy = current_user.candy - @pokemon.edit_cost(params[:p])
                    current_user.update_attribute(:candy, new_candy)
                    @pokemon.update(params[:p])
                    flash[:success] = "Success! Training Session completed."
                    redirect "/pokemon/#{@pokemon.id}"
                else
                    flash[:danger] = "Failure! You don't not have enough Candy to complete this Training Session."
                    redirect "/pokemon/#{@pokemon.id}"
                end
            end
        else
            redirect "/sign-in"
        end
    end

    delete '/pokemon/:id' do
        if logged_in?
            @pokemon = current_user.pokemon.find_by(id: params[:id])
            if @pokemon && @pokemon.destroy
                redirect "/trainers/#{current_user.id}"
            end
        else
            redirect "/sign-in"
        end
    end

    helpers do
        
        def paginate(n)
            (n.to_i-1)*20
        end
    end

end