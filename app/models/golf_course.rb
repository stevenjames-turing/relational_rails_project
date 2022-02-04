class GolfCourse < ApplicationRecord
    has_many :holes
    validates :hole_count, :name, :public, presence: true
end