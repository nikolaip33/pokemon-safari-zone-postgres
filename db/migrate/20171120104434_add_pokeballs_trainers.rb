class AddPokeballsTrainers < ActiveRecord::Migration
  def change
    add_column :trainers, :pokeballs, :integer
  end
end
