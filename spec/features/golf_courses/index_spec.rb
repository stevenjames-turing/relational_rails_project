require 'rails_helper'

RSpec.describe 'golf course index page' do 
    it 'displays name of each course' do 
        course_1 = GolfCourse.create(name: "Augusta", holes: 18, public: false)
        course_2 = GolfCourse.create(name: "Pheasant Run", holes: 18, public: true)

        visit "/golf_courses"
        
        expect(page).to have_content(course_1.name)
        expect(page).to have_content(course_2.name)
        expect(page).to_not have_content(course_1.public)
    end

    it 'displays the golf courses info by ID' do 
        course_1 = GolfCourse.create(name: "Augusta", holes: 18, public: false)
        course_2 = GolfCourse.create(name: "Pheasant Run", holes: 18, public: true)
    
        visit "/golf_courses/#{course_1.id}"

        expect(page).to have_content(course_1.name)
        expect(page).to have_content(course_1.holes)
        expect(page).to have_content(course_1.public)
        expect(page).to_not have_content(course_2.name)
        expect(page).to_not have_content(course_2.public)
    end
end