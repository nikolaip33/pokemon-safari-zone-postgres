class EditPokemonBases < ActiveRecord::Migration
  def change
    change_table :pokemon_bases do |t|
      t.change :height, :integer
      t.change :weight, :integer
      t.change :level, :integer
    end
  end
end
