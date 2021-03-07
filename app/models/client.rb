class Client < ApplicationRecord
    has_one :user, as :meta, dependent: :destroy
    accepts_nested_attributes_for :user
end
