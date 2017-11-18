class PokemonController < ApplicationController

    get '/pokemon' do
        redirect "/pokemon/page/1"
    end
    
    get '/pokemon/page/:id' do
        @pokemon_list = Pokemon.limit(20).offset(paginate(params[:id]))
        binding.pry
    end
    
    post '/pokemon' do
        @trainer = Trainer.find_by(id: session[:user_id])
        @pokemon = Pokemon.create_from_base(params[:id])
        redirect "/pokemon/#{@pokemon.id}"
    end

    get '/pokemon/:id/edit' do
        if logged_in?
            if @pokemon = current_user.pokemon.find_by(id: params[:id])
                @base = PokemonBase.find_by(id: @pokemon.pokedex_number)
                @trainer = @pokemon.trainer
                erb :"pokemon/edit"
            end
        elsif logged_in?
            redirect "/trainers/current_user.id"
        else
            redirect "/sign-in"
        end
    end

    get '/pokemon/:id' do
        if @pokemon = Pokemon.find_by(id: params[:id])
            @trainer = @pokemon.trainer
            erb :"pokemon/show"
        else
            redirect "/pokemon"
        end
    end

    patch '/pokemon/:id' do
        if logged_in?
            if @pokemon = current_user.pokemon.find_by(id: params[:id])
                @pokemon.update(params[:p])
                redirect "/pokemon/#{@pokemon.id}"
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