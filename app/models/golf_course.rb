class GolfCourse < ApplicationRecord
    has_many :holes, dependent: :delete_all  
    validates_presence_of :hole_count, :name
    validates_inclusion_of :public, in: [true, false]

    def self.sort_created_at_desc
        order(created_at: :desc)
    end

    def hole_record_count
        holes.count
    end

    def self.order_by(data, order_type)
        data.order(order_type)
    end
end