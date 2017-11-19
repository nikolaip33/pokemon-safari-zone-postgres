class AddTrainersCandy < ActiveRecord::Migration
  def change
    add_column :trainers, :candy, :integer
  end
end
