require 'rails_helper'

RSpec.describe 'golf course show page' do 
    it 'displays the golf courses info by ID' do 
        course_1 = GolfCourse.create(name: "Augusta", hole_count: 18, public: false)
        course_2 = GolfCourse.create(name: "Pheasant Run", hole_count: 18, public: true)
    
        visit "/golf_courses/#{course_1.id}"

        expect(page).to have_content(course_1.name)
        expect(page).to have_content(course_1.hole_count)
        expect(page).to have_content(course_1.public)
        expect(page).to_not have_content(course_2.name)
        expect(page).to_not have_content(course_2.public)
    end
end