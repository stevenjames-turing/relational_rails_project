class Hole < ApplicationRecord
    belongs_to :golf_course 
    validates :name, :par, :hazard, presence: true 
end