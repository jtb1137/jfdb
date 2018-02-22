class Movie < ApplicationRecord
    validates :title, uniqueness: true
    validates :title, presence: true
    validates :synopsis, presence: true
    validates :mpaa_rating, presence: true

    has_many :selections
    has_many :lists, through: :selection
end
