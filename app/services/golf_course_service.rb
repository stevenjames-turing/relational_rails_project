class GolfCourseService
    def self.data_sorter(data, params)
        if params[:par] != nil
            reduced_data = data.where("par > #{params[:par].to_i}")
            GolfCourse.order_by(reduced_data, :par)
        elsif params[:hole_name] != nil
            name_search = data.where("name = '#{params[:hole_name]}'")
            if name_search.count < 1
                partial_name = "%" + "#{params[:hole_name]}" + "%"
                name_search = data.where("name ilike '#{partial_name}'")
                GolfCourse.order_by(name_search, :name)
            else 
                GolfCourse.order_by(name_search, :name)
            end
        elsif params[:sort] == "name"
            GolfCourse.order_by(data, params[:sort])
        else   
            data
        end
    end
end