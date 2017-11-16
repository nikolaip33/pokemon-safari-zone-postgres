class AddTrainersColumns < ActiveRecord::Migration
  def change
    add_column :trainers, :first_name, :string
    add_column :trainers, :last_name, :string
  end
end
