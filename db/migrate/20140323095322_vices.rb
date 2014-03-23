class Vices < ActiveRecord::Migration
  def change
    create_table(:vices) do |t|
        t.string :name
        t.references :user
    end
  end
end
