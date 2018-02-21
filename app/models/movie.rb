class Movie < ApplicationRecord
    has_many :list_movies
    has_many :lists, through: :list_movies
end
