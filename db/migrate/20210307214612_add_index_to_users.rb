class AddIndexToUsers < ActiveRecord::Migration[6.1]
  def change
    add_index :users, [:meta_id, :meta_type]
  end
end
