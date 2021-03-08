class Client < ApplicationRecord
    has_one :user, as: :meta, dependent: :destroy, inverse_of: :meta
    has_many :appointments, inverse_of: :client
    accepts_nested_attributes_for :user
end
