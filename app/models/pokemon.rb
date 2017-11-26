class Pokemon < ActiveRecord::Base
    belongs_to :trainer

    STATS = ["level", "hp", "attack", "speed", "defense", "special_attack", "special_defense"]
    
    def self.create_from_base(id, trainer)
        data = PokemonBase.find_or_create_from_api(id).as_json
        data["pokedex_number"] = data.delete("id")
        data["shiny"] = "shiny" if rand(1..10) == 10
        pokemon = trainer.pokemon.create(data)
    end

    def valid_edit?(new, trainer)
        trainer.candy >= self.edit_cost(new)
    end

    def edit_cost(new)
        current = self.as_json
        total = 0
        STATS.each do |s|
            total += (current[s] - new[s].to_i).abs
        end
        total
    end

end