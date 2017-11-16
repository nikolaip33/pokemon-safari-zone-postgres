class EditPokemonTable < ActiveRecord::Migration
  def change
    change_table :pokemon do |t|
      t.change :height, :integer
      t.change :weight, :integer
      t.change :level, :integer
    end
  end
end
