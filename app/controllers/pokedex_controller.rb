class PokedexController < ApplicationController

    get '/pokedex/pokemon/:id' do
        session[:user_id] = Trainer.first.id
        @pokemon = PokemonBase.find_or_create_from_api(params[:id])
        erb :"/pokedex/show"
    end

    get '/pokedex/page/:page' do
        @index = index(params[:page])
        path = "http://pokeapi.co/api/v2/pokemon/#{paginate(params[:page])}"
        @pokelist = JSON.parse(RestClient.get(path, headers={}))["results"]

        # @pokelist = [{"url"=>"https://pokeapi.co/api/v2/pokemon/21/", "name"=>"spearow"},
        # {"url"=>"https://pokeapi.co/api/v2/pokemon/22/", "name"=>"fearow"},
        # {"url"=>"https://pokeapi.co/api/v2/pokemon/23/", "name"=>"ekans"},
        # {"url"=>"https://pokeapi.co/api/v2/pokemon/24/", "name"=>"arbok"},
        # {"url"=>"https://pokeapi.co/api/v2/pokemon/25/", "name"=>"pikachu"},
        # {"url"=>"https://pokeapi.co/api/v2/pokemon/26/", "name"=>"raichu"},
        # {"url"=>"https://pokeapi.co/api/v2/pokemon/27/", "name"=>"sandshrew"},
        # {"url"=>"https://pokeapi.co/api/v2/pokemon/28/", "name"=>"sandslash"},
        # {"url"=>"https://pokeapi.co/api/v2/pokemon/29/", "name"=>"nidoran-f"},
        # {"url"=>"https://pokeapi.co/api/v2/pokemon/30/", "name"=>"nidorina"},
        # {"url"=>"https://pokeapi.co/api/v2/pokemon/31/", "name"=>"nidoqueen"},
        # {"url"=>"https://pokeapi.co/api/v2/pokemon/32/", "name"=>"nidoran-m"},
        # {"url"=>"https://pokeapi.co/api/v2/pokemon/33/", "name"=>"nidorino"},
        # {"url"=>"https://pokeapi.co/api/v2/pokemon/34/", "name"=>"nidoking"},
        # {"url"=>"https://pokeapi.co/api/v2/pokemon/35/", "name"=>"clefairy"},
        # {"url"=>"https://pokeapi.co/api/v2/pokemon/36/", "name"=>"clefable"},
        # {"url"=>"https://pokeapi.co/api/v2/pokemon/37/", "name"=>"vulpix"},
        # {"url"=>"https://pokeapi.co/api/v2/pokemon/38/", "name"=>"ninetales"},
        # {"url"=>"https://pokeapi.co/api/v2/pokemon/39/", "name"=>"jigglypuff"},
        # {"url"=>"https://pokeapi.co/api/v2/pokemon/40/", "name"=>"wigglytuff"}]
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