class Review < ApplicationRecord
    belongs_to :appointment
    scope :high_to_low, -> { order('rating DESC') }
    scope :low_to_high, ->  { order('rating ASC') }

    validates :rating, presence: true
    validates :rating, numericality: { less_than_or_equal_to: 10 }
    validates :content, presence: true
end
