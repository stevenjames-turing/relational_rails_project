class GolfCourseHolesController < ApplicationController
    def index
        @course = GolfCourse.find(params[:id])
        hole_records = GolfCourse.find(params[:id]).holes
        @golf_course_holes = GolfCourseService.golf_course_holes(hole_records, params[:sort])
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