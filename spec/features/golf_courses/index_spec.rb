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

    it 'has a link on every page' do 
        augusta = GolfCourse.create!(name: "Augusta", hole_count: 18, public: false)
        tea_olive = augusta.holes.create!(hazard: true, name: "Tea Olive", par: 4)
        pink_dogwood = augusta.holes.create!(hazard: true, name: "Pink Dogwood", par: 5)
        flowering_peach = augusta.holes.create!(hazard: false, name: "Flowering Peach", par: 4)
        pinehurst = GolfCourse.create!(name: "Pinehurst No. 2", hole_count: 18, public: true)
        hole_1 = pinehurst.holes.create!(hazard: true, name: "The 1st Hole", par: 4)
        hole_2 = pinehurst.holes.create!(hazard: true, name: "The 2nd Hole", par: 4)
        
        visit "/golf_courses"

        expect(page).to have_link("Golf Course Index")
    end
end