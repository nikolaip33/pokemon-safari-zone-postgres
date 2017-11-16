class CreatePokemonBases < ActiveRecord::Migration
  def change
    create_table :pokemon_bases do |t|
      t.string :name
      t.string :type_1
      t.string :type_2
      t.string :height
      t.string :weight
      t.string :level
    end
  end
end
