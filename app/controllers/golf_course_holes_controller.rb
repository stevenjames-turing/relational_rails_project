class GolfCourseHolesController < ApplicationController
    def index
        @course = GolfCourse.find(params[:id])
        # @golf_course_holes = GolfCourse.find(params[:id]).holes
        
        hole_records = GolfCourse.find(params[:id]).holes
        if params[:sort] == nil
            @golf_course_holes = hole_records
        else
            @golf_course_holes = hole_records.order_by(params[:sort])
        end 
    end
    
    def new
        @course = GolfCourse.find(params[:id])
    end
    
    def create 
        course = GolfCourse.find(params[:id])
        hole = course.holes.create!(hazard: params[:hazard], name: params[:name], par: params[:par])
        redirect_to "/golf_courses/#{course.id}/holes"
    end
end