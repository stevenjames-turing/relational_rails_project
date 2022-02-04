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
    
    it 'lists Courses by most recently created' do 
        augusta = GolfCourse.create!(name: "Augusta", hole_count: 18, public: false)
        course_2 = GolfCourse.create!(name: "Pheasant Run", hole_count: 18, public: true)
        pinehurst = GolfCourse.create!(name: "Pinehurst No. 2", hole_count: 18, public: true)
        
        visit "/golf_courses"

        expect(pinehurst.name).to appear_before(course_2.name) 
        expect(course_2.name).to appear_before(augusta.name) 
        expect(augusta.name).to_not appear_before(pinehurst.name)
    end
end