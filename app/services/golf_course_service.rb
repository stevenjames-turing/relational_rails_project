class GolfCourseService
    def self.golf_course_holes(data, order_type)
        if order_type
            GolfCourse.order_by(data, order_type.to_sym)
        else   
            data
        end
    end
end