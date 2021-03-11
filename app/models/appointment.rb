class Appointment < ApplicationRecord
    belongs_to :client, inverse_of: :appointments
    belongs_to :contractor, inverse_of: :appointments
    has_one :review
    validates :appointment_time, uniqueness: { scope: :contractor_id }
end
