class Sighting < ApplicationRecord
    belongs_to :animal
    validates :date, :lat, :long, presence: true
end
