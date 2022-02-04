class Team < ApplicationRecord
  has_many :players
  # validates_inclusion_of :coach, 
  # in: ['true', 'false']
end