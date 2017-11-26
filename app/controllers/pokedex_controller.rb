class PokedexController < ApplicationController
    
        get '/pokedex' do
            redirect "/pokedex/page/1"
        end
    
        get '/safari' do
            @pokemon = PokemonBase.find_by(id: rand(1..801))
            erb :"/pokedex/safari"
        end
    
        get '/pokedex/:id' do
            redirect "/pokedex/page/#{params[:id]}"
        end
    
        get '/pokedex/pokemon/:id' do
            if !params[:id].to_i.between?(1,801)
                flash[:danger] = "Failure! We could not find that Pokédex Entry."
                redirect "/pokedex/page/1"
            else
                @pokemon = PokemonBase.find_by(id: params[:id])
                erb :"/pokedex/show"
            end
        end
    
        get '/pokedex/page/:page' do
            if params[:page].to_i.between?(1,40)
                @pokedex = Pokedex.new(params[:page].to_i)
                @index = @pokedex.index
                @active = @pokedex.page
                @pokelist = @pokedex.pokemon
                @navlinks = @pokedex.create_nav
                erb :"/pokedex/page"
            elsif params[:page].to_i <= 0
                redirect "/pokedex/page/1"
            elsif params[:page].to_i >= 40
                redirect "/pokedex/page/40"
            else
                redirect "/pokedex/page/1"
            end
        end
    
    end
    