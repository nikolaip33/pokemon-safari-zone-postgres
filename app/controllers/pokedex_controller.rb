class PokedexController < ApplicationController

    get '/pokedex/pokemon/:id' do
        @pokemon = PokemonBase.find_or_create_from_api(params[:id])
        erb :"/pokedex/show"
    end


    def self.img_index(n)
        if n.to_i < 10
            "00#{n}"
        elsif n.to_i < 100
            "0#{n}"
        else
            n.to_s
        end
    end

end