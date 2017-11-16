class PokedexController < ApplicationController

    get '/pokedex/pokemon/:id' do
        session[:user_id] = Trainer.first.id
        @pokemon = PokemonBase.find_or_create_from_api(params[:id])
        erb :"/pokedex/show"
    end

    get '/pokedex/page/:page' do
        path = "http://pokeapi.co/api/v2/pokemon/#{paginate(params[:page])}"
        @index = index(params[:page])
        @pokelist = JSON.parse(RestClient.get(path, headers={}))["results"]
        erb :"/pokedex/page"
    end

    helpers do

        def paginate(n)
            offset = (n.to_i-1)*20
            limit = offset == 140 ? 11 : 20
            "?limit=#{limit}&offset=#{offset}"
        end

        def index(n)
            ((n.to_i-1)*20)+1
        end

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