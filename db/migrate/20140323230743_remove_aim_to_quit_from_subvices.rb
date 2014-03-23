class RemoveAimToQuitFromSubvices < ActiveRecord::Migration
  def change
    remove_column :subvices, :aim_to_quit, :boolean
  end
end
