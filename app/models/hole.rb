class Hole < ApplicationRecord
    belongs_to :golf_course 
    # validates :name, :par, :hazard, presence: true 

    def self.hazard
        Hole.all.where(hazard: true)
    end
end