class CreatePokemon < ActiveRecord::Migration
  def change
    create_table :pokemon do |t|
      t.string :name
      t.string :type_1
      t.string :type_2
      t.integer :height
      t.integer :weight
      t.integer :level
      t.string :nickname
      t.integer :trainer_id
    end
  end
end
