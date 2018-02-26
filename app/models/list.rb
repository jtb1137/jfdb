class List < ApplicationRecord
    validates :name, presence: true
    validates :description, length: { maximum: 250 }

    belongs_to :user
    
    has_many :selections
    has_many :movies, through: :selections
    accepts_nested_attributes_for :movies

    def movies_attributers=(mvoies_attributes)
        movies_attributes.values.each do |movie_attribute|
            movie = Movie.find_or_create_by(movie_attribute)
            self.movies << movie
        end
    end
end