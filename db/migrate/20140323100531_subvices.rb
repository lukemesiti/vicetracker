class Subvices < ActiveRecord::Migration
  def change
    create_table(:subvices) do |t|
        t.string :name
        t.integer :consumed_per_day
        t.integer :cost_per_day
        t.boolean :aim_to_quit
        t.references :vice
    end
  end
end
