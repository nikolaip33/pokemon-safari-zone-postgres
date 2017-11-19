class Pokedex

    attr_accessor :page
    
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

    def initialize(page)
        path = "http://pokeapi.co/api/v2/pokemon/#{paginate(page.to_i)}"
        @page = JSON.parse(RestClient.get(path, headers={}))["results"]
    end

    def validate
        self.page.collect do |pokemon|
            if WHITELIST.include?(pokemon["name"])
                pokemon["name"]
            else
                pokemon["name"].split("-").first
            end
        end
    end
end