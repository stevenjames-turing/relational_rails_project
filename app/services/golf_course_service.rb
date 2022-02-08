class GolfCourseService
    def self.golf_course_holes(data, params)
        if params[:par] != nil
            reduced_data = data.where("par > #{params[:par].to_i}")
            GolfCourse.order_by(reduced_data, :par)
        elsif params[:sort] == "name"
            require 'pry'; binding.pry
            GolfCourse.order_by(data, params[:sort])
        else   
            data
        end
    end

end