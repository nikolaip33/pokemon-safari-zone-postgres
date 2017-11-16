class AddPokedexNumberToPokemon < ActiveRecord::Migration
  def change
    add_column :pokemon, :pokedex_number, :integer
  end
end
