class Review < ApplicationRecord
    belongs_to :appointment

    validates :rating, presence: true
    validates :rating, numericality: { less_than_or_equal_to: 10 }
    validates :content, presence: true
end
