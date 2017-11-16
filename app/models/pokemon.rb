class Pokemon < ActiveRecord::Base
    
    belongs_to :trainer
    
    def self.create_from_base(id)
        data = PokemonBase.find_by(id: id.to_i)
        pokemon = Pokemon.new
        pokemon.name = data.name
        pokemon.type_1 = data.type_1
        pokemon.type_2 = data.type_2
        pokemon.weight = data.weight
        pokemon.height = data.height
        pokemon.level = data.level
        pokemon.hp = data.hp
        pokemon.attack = data.attack
        pokemon.defense = data.defense
        pokemon.speed = data.speed
        pokemon.special_defense = data.special_defense
        pokemon.special_attack = data.special_attack
        pokemon.pokedex_number = data.id
        pokemon.save
        pokemon
    end

end