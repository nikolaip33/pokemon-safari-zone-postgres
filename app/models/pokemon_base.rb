class PokemonBase < ActiveRecord::Base
    
    WHITELIST = [
        "ho-oh",
        "jangmo-o",
        "hakamo-o",
        "kommo-o",
        "tapu-koko",
        "tapu-lele",
        "tapu-bulu",
        "tapu-fini",
        "type-null",
        "porygon-z",
        "mime-jr"
    ]

    def self.create_from_api(id)
        path = "http://pokeapi.co/api/v2/pokemon/#{id}"
        data = JSON.parse(RestClient.get(path, headers={}))
        pokemon = self.create
        pokemon.id = id
        if WHITELIST.include?(data["name"])
            pokemon.name = data["name"]
        else
            pokemon.name = data["name"].split("-").first
        end
        pokemon.height = data["height"]
        pokemon.weight = data["weight"]
        pokemon.type_1 = data["types"][0]["type"]["name"]
        pokemon.type_2 = data["types"][1]["type"]["name"] if data["types"][1]
        pokemon.speed = data["stats"][0]["base_stat"]
        pokemon.special_defense = data["stats"][1]["base_stat"]
        pokemon.special_attack = data["stats"][2]["base_stat"]
        pokemon.defense = data["stats"][3]["base_stat"]
        pokemon.attack = data["stats"][4]["base_stat"]
        pokemon.hp = data["stats"][5]["base_stat"]
        pokemon.level = rand(3..9)
        pokemon.save
        pokemon
    end

    def self.find_or_create_from_api(id)
        find_by(id: id.to_i) || create_from_api(id)
    end

end