class AddDefaultsToTrainers < ActiveRecord::Migration
  def change
    change_column :trainers, :candy, :integer, :default => 5000
    change_column :trainers, :pokeballs, :integer, :default => 5
  end
end
