class PokemonController < ApplicationController

    get '/pokemon/:id/edit' do
        if logged_in?
            if @pokemon = current_user.pokemon.find_by(id: params[:id])
                @base = PokemonBase.find_by(id: @pokemon.pokedex_number)
                @trainer = current_user
                erb :"pokemon/edit"
            else
                redirect "/trainers/current_user.id"
            end
        else
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
                    redirect "/pokemon/#{@pokemon.id}"
                else
                    flash[:notice] = "Not Enough Candy."
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