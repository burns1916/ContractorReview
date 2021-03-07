class User < ApplicationRecord
    belongs_to :meta polymorphic: true
end
