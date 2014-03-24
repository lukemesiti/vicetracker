class AddGoalToSubvices < ActiveRecord::Migration
  def change
    add_column :subvices, :goal, :integer
  end
end
