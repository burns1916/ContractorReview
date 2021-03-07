class CreateAppointments < ActiveRecord::Migration[6.1]
  def change
    create_table :appointments do |t|
      t.string :job_name
      t.text :job_description
      t.datetime :appointment_time
      t.integer :client_id
      t.integer :contractor_id
      t.timestamps
    end
  end
end
