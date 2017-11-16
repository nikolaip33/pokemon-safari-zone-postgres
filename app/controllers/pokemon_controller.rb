class PokemonController < ApplicationController

    post '/pokemon' do
        binding.pry
        @pokemon = Pokemon.create_from_base(params[:id])
        binding.pry
        redirect "/pokemon/#{@pokemon.id}"
    end

end