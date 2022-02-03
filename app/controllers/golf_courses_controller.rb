class GolfCoursesController < ApplicationController

    def index
        @golf_courses = GolfCourse.all
    end

    def show
        @golf_course = GolfCourse.find(params[:id])
    end

end