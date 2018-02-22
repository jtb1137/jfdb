class List < ApplicationRecord
    validates :name, presence: true
    validates :description, length: { maximum: 250 }

    belongs_to :user
    
    has_many :selections
    has_many :movies, through: :selections
end
