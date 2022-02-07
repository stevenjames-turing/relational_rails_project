class Hole < ApplicationRecord
    belongs_to :golf_course 
    # validates :name, :par, :hazard, presence: true 

    def self.has_hazard
        Hole.all.where(hazard: true)
    end
end