class List < ApplicationRecord
    validates :name, presence: true
    validated :description, length: { maximum: 250 }
end
