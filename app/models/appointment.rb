class Appointment < ApplicationRecord
    belongs_to :clients
    belongs_to :contractors
end
