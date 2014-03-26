class AddCreatedAtToSubvices < ActiveRecord::Migration
  def change
    add_column :subvices, :created_at, :datetime
  end
end
