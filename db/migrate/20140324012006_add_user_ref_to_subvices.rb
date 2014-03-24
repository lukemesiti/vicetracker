class AddUserRefToSubvices < ActiveRecord::Migration
  def change
    add_reference :subvices, :user, index: true
  end
end
