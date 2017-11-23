class Pokedex

    attr_accessor :page, :pokemon
    
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
        "mime-jr",
        "mr-mime"
    ]

    def initialize(page)
        @page = page.to_i
        path = "http://pokeapi.co/api/v2/pokemon/#{paginate(self.page.to_i)}"
        @pokemon = JSON.parse(RestClient.get(path, headers={}))["results"]
    end

    def validate
        self.pokemon.collect { |p| WHITELIST.include?(p["name"]) ? p["name"] : p["name"].split("-").first }
    end

    def create_nav
        a = [] 
        first = 1
        last = 40
        
        if self.page <= 5
          a[0] = first
          a[1] = 2
          a[2] = 3
          a[3] = 4
          a[4] = 5
          a[5] = 6
          a[6] = last-(last)*2/3.ceil
          a[7] = last-(last)*1/3.ceil
          a[8] = last
    
        elsif self.page >= last-4
          a[0] = first
          a[1] = (self.page)*1/3.ceil
          a[2] = (self.page)*2/3.ceil
          a[3] = last-5
          a[4] = last-4
          a[5] = last-3
          a[6] = last-2
          a[7] = last-1
          a[8] = last
        else
          a[0] = first
          a[1] = (self.page)*1/3.ceil
          a[2] = (self.page)*2/3.ceil
          a[3] = self.page-1
          a[4] = self.page  
          a[5] = self.page+1
          a[6] = last-(last-self.page)*2/3.ceil
          a[7] = last-(last-self.page)*1/3.ceil
          a[8] = last
        end
        a
    end

    def index
        ((@page-1)*20)+1
    end

end

def paginate(n)
    offset = (n.to_i-1)*20
    limit = offset == 780 ? 21 : 20
    "?limit=#{limit}&offset=#{offset}"
end