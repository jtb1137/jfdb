class List < ApplicationRecord
    validates :name, presence: true
    validates :description, length: { maximum: 250 }

    belongs_to :user
end
