class ConsumedAt < ActiveRecord::Migration
  def change
    create_table(:consumed_at) do |t|
        t.integer :quantity
        t.integer :cost
        t.timestamp :created_at
        t.references :subvice
    end
  end
end
