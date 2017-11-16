class AddColumnsPokemonTable < ActiveRecord::Migration
  def change
    add_column :pokemon, :speed, :integer
    add_column :pokemon, :special_defense, :integer
    add_column :pokemon, :special_attack, :integer
    add_column :pokemon, :defense, :integer
    add_column :pokemon, :attack, :integer
    add_column :pokemon, :hp, :integer
  end
end
