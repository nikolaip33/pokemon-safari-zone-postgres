class AddColumnsPokemonBases < ActiveRecord::Migration
  def change
    add_column :pokemon_bases, :speed, :integer
    add_column :pokemon_bases, :special_defense, :integer
    add_column :pokemon_bases, :special_attack, :integer
    add_column :pokemon_bases, :defense, :integer
    add_column :pokemon_bases, :attack, :integer
    add_column :pokemon_bases, :hp, :integer
  end
end
