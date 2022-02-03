require 'rails_helper'

RSpec.describe 'golf course index page' do 
    it 'displays name of each course' do 
        course_1 = GolfCourse.create(name: "Augusta", hole_count: 18, public: false)
        course_2 = GolfCourse.create(name: "Pheasant Run", hole_count: 18, public: true)

        visit "/golf_courses"
        
        expect(page).to have_content(course_1.name)
        expect(page).to have_content(course_2.name)
        expect(page).to_not have_content(course_1.public)
    end
end