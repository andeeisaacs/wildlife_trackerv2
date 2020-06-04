class Animal < ApplicationRecord
    has_many :sightings
    accepts_nested_attributes_for :sightings
    validates :common_name, :latin_name, :kingdom, presence: true
    validates :common_name, :latin_name, :kingdom, uniqueness: true
    validate :same_name

    private
    def same_name
        errors.add(:common_name, 'The common name and the latin name cannot be the same.') if common_name == latin_name
    end
end
