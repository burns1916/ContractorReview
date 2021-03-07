class CreateUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :users do |t|
      t.integer :meta_id
      t.string :meta_type
      t.string :email
      t.string :password_digest

      t.timestamps
    end
  end
end
