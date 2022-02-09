class GolfCoursesController < ApplicationController

    def index
        course_data = GolfCourse.sort_created_at_desc
        @golf_courses = GolfCourseService.data_sorter(course_data, params)

    end

    def show
        @golf_course = GolfCourse.find(params[:id])
    end
    
    def new
    end

    def create 
        course = GolfCourse.create!({
            name: params[:name],
            public: params[:public],
            hole_count: params[:hole_count]})
        redirect_to "/golf_courses"
    end
    
    def edit
        @golf_course = GolfCourse.find(params[:id])
    end
    
    def update
        golf_course = GolfCourse.find(params[:id])
        golf_course.update({
            name: params[:name],
            public: params[:public],
            hole_count: params[:hole_count]})
            redirect_to "/golf_courses/#{golf_course.id}"
        end
        
    def destroy
        GolfCourse.destroy(params[:id])
        redirect_to "/golf_courses"
    end

end