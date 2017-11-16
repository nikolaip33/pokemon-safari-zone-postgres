class AddShinyPokemon < ActiveRecord::Migration
  def change
    add_column :pokemon, :shiny, :string
  end
end
