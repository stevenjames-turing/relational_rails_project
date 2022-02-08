class Hole < ApplicationRecord
    belongs_to :golf_course 
    validates_presence_of :name, :par
    validates_inclusion_of :hazard, in: [true, false]

    def self.has_hazard
        Hole.all.where(hazard: true)
    end
end