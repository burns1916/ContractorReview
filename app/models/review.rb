class Review < ApplicationRecord
    belongs_to :appointment

    validates :rating, presence: true
    validates :content, presence: true
end
