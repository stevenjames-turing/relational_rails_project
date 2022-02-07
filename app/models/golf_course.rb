class GolfCourse < ApplicationRecord
    has_many :holes
    # validates :hole_count, :name, :public, presence: true

    def self.sort_created_at_desc
        order(created_at: :desc)
    end

    def hole_record_count
        holes.count
    end

    
end