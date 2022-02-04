class Player < ApplicationRecord
  belongs_to :team
  validates :name, :injured, :number, presence: true 
end