class CreateJoinTableViceUser < ActiveRecord::Migration
  def change
    remove_column :vices, :user_id, :integer
    create_join_table :vices, :users do |t|
      t.index [:vice_id, :user_id]
      t.index [:user_id, :vice_id]
    end
  end
end
