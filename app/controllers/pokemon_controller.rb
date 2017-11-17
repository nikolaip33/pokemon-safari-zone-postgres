class PokemonController < ApplicationController

    post '/pokemon' do
        @trainer = Trainer.find_by(id: session[:user_id])
        @pokemon = Pokemon.create_from_base(params[:id])
        binding.pry
        redirect "/pokemon/#{@pokemon.id}"
    end

    get '/pokemon/:id/edit' do
        if logged_in?
            if @pokemon = current_user.pokemon.find_by(id: params[:id])
                @base = PokemonBase.find_by(id: @pokemon.pokedex_number)
                erb :"pokemon/edit"
            end
        elsif logged_in?
            redirect "/trainers/current_user.id"
        else
            redirect "/sign-in"
        end
        
    end

    get '/pokemon/:id' do
        @pokemon = Pokemon.find_by(id: params[:id])
        erb :"pokemon/show"
    end

    patch '/pokemon/:id' do
        binding.pry
    end

end