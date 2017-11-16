class PokemonController < ApplicationController

    post '/pokemon' do
        @trainer = Trainer.find_by(id: session[:user_id])
        @pokemon = Pokemon.create_from_base(params[:id])
        binding.pry
        redirect "/pokemon/#{@pokemon.id}"
    end

    get '/pokemon/:id' do
        @pokemon = Pokemon.find_by(id: params[:id])
        erb :"pokemon/show"
    end

end