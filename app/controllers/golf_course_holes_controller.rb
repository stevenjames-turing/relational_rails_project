class GolfCourseHolesController < ApplicationController
    def index
        @course = GolfCourse.find(params[:id])
        @golf_course_holes = GolfCourse.find(params[:id]).holes
    end
end