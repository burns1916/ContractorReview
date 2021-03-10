class User < ApplicationRecord
    belongs_to :meta, polymorphic: true
    has_secure_password
end
