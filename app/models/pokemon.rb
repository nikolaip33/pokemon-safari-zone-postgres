class Pokemon < ActiveRecord::Base
    
    belongs_to :trainer
    
    def self.create_from_base(id, trainer)
        data = PokemonBase.find_by(id: id.to_i).as_json
        data["pokedex_number"] = data.delete("id")
        pokemon = trainer.pokemon.create(data)
    end

end