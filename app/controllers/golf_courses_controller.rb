class GolfCoursesController < ApplicationController

    def index
        @golf_courses = GolfCourse.order(created_at: :desc)
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

end