class GolfCourseService
    def self.data_sorter(data, params)
        if params[:par] != nil
            reduced_data = data.where("par > #{params[:par].to_i}")
            GolfCourse.order_by(reduced_data, :par)
        elsif params[:hole_name] != nil 
            name_search = data.where("name = '#{params[:hole_name]}'")
            GolfCourse.order_by(name_search, :name)
        elsif params[:sort] == "name"
            GolfCourse.order_by(data, params[:sort])
        else   
            data
        end
    end
end