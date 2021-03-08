class Appointment < ApplicationRecord
    belongs_to :client, inverse_of: :appointments
    belongs_to :contractor, inverse_of: :appointments
end
