class List < ApplicationRecord
    has_many :list_movies
    has_many :movies, through: :list_movies
end
