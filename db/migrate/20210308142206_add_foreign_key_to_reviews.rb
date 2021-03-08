class AddForeignKeyToReviews < ActiveRecord::Migration[6.1]
  def change
    add_column :reviews, :appointment_id, :integer
  end
end
