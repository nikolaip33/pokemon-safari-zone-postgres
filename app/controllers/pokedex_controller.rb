class PokedexController < ApplicationController

    get '/pokedex' do
        redirect "/pokedex/page/1"
    end

    get '/pokedex/:id' do
        redirect "/pokedex/page/#{params[:id]}"
    end

    get '/pokedex/pokemon/:id' do
        @pokemon = PokemonBase.find_or_create_from_api(params[:id])
        erb :"/pokedex/show"
    end

    post '/pokedex/pokemon/:id' do
        if logged_in?
            @pokemon = Pokemon.create_from_base(params[:id], current_user)
            redirect "/pokemon/#{@pokemon.id}"
        else
            redirect "/sign-in"
        end
    end

    get '/pokedex/page/:page' do
        @index = index(params[:page])
        @pokelist = Pokedex.new(params[:page].to_i).validate
        @navlinks = create_nav(params[:page].to_i)
        erb :"/pokedex/page"
    end

    helpers do

        def index(n)
            ((n.to_i-1)*20)+1
        end

        def create_nav(n)
            a = [] 
            first = 1
            last = 40
            
            if n <= 5
              a[0] = first
              a[1] = 2
              a[2] = 3
              a[3] = 4
              a[4] = 5
              a[5] = 6
              a[6] = last-(last)*2/3.ceil
              a[7] = last-(last)*1/3.ceil
              a[8] = last
        
            elsif n >= last-5
              a[0] = first
              a[1] = (n)*1/3.ceil
              a[2] = (n )*2/3.ceil
              a[3] = last-5
              a[4] = last-4
              a[5] = last-3
              a[6] = last-2
              a[7] = last-1
              a[8] = last
            else
              a[0] = first
              a[1] = (n)*1/3.ceil
              a[2] = (n)*2/3.ceil
              a[3] = n-1
              a[4] = n  
              a[5] = n+1
              a[6] = last-(last-n)*2/3.ceil
              a[7] = last-(last-n)*1/3.ceil
              a[8] = last
            end
            a
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