class PokemonBase < ActiveRecord::Base

    def self.create_from_api(id)
        path = "http://pokeapi.co/api/v2/pokemon/#{id}"
        data = JSON.parse(RestClient.get(path, headers={}))
        pokemon = self.create
        pokemon.id = id
        pokemon.name = data["name"]
        pokemon.height = data["height"]
        pokemon.weight = data["weight"]
        pokemon.type_1 = data["types"][0]["type"]["name"]
        pokemon.type_2 = data["types"][1]["type"]["name"] if data["types"][1] != nil
        pokemon.level = 1
        pokemon.save
        pokemon
    end

    def self.find_or_create_from_api(id)
        self.find_by(id: id.to_i) || self.create_from_api(id)
    end

end