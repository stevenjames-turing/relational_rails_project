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
        
        visit "/golf_courses/#{augusta.id}"
        
        expect(page).to have_link("Golf Course Index")
        click_link("Golf Course Index")
        expect(current_path).to eq("/golf_courses")
    end
    
    it 'can create a new Golf Course' do 
        pinehurst = GolfCourse.create!(name: "Pinehurst No. 2", hole_count: 18, public: true)
        hole_1 = pinehurst.holes.create!(hazard: true, name: "The 1st Hole", par: 4)
        hole_2 = pinehurst.holes.create!(hazard: true, name: "The 2nd Hole", par: 4)
        hole_3 = pinehurst.holes.create!(hazard: false, name: "The 3rd Hole", par: 4)
        
        visit "/golf_courses"
        
        expect(page).to have_link("New Golf Course")
        click_link("New Golf Course")
        expect(current_path).to eq("/golf_courses/new")
        
        fill_in :name, with: "Eagle Springs"
        fill_in :hole_count, with: 9
        select "true", :from => "public"
        
        click_button("Submit")
        expect(current_path).to eq("/golf_courses")
    end
    
    it 'has links to edit Golf Course next to each record' do
        augusta = GolfCourse.create!(name: "Augusta", hole_count: 18, public: false)
        tea_olive = augusta.holes.create!(hazard: true, name: "Tea Olive", par: 4)
        pink_dogwood = augusta.holes.create!(hazard: true, name: "Pink Dogwood", par: 5)
        pinehurst = GolfCourse.create!(name: "Pinehurst No. 2", hole_count: 18, public: true)
        hole_1 = pinehurst.holes.create!(hazard: true, name: "The 1st Hole", par: 4)
        hole_2 = pinehurst.holes.create!(hazard: true, name: "The 2nd Hole", par: 4)
        
        visit "/golf_courses"
        
        expect(page).to have_link("Edit")
        first(:link, "Edit").click
        expect(current_path).to eq("/golf_courses/#{pinehurst.id}/edit")
    end
    
    it 'has delete buttons next to each Golf Course' do 
        augusta = GolfCourse.create!(name: "Augusta", hole_count: 18, public: false)
        tea_olive = augusta.holes.create!(hazard: true, name: "Tea Olive", par: 4)
        pinehurst = GolfCourse.create!(name: "Pinehurst No. 2", hole_count: 18, public: true)
        hole_1 = pinehurst.holes.create!(hazard: true, name: "The 1st Hole", par: 4)
        saintandrews = GolfCourse.create!(name: "St. Andrews", hole_count: 72, public: true)
        burn = saintandrews.holes.create!(hazard: true, name: "Burn", par: 4)
        
        visit "/golf_courses"
        
        expect(page).to have_link("Delete")
        first(:link, "Delete").click
        expect(current_path).to eq("/golf_courses")
        
        expect(page).to have_content(augusta.name)
        expect(page).to have_content(pinehurst.name)
        expect(page).to_not have_content(saintandrews.name)
    end
    
    it 'can search by name(exact match)' do 
        pinehurst = GolfCourse.create!(name: "Pinehurst", hole_count: 18, public: true)
        pinehurst_2 = GolfCourse.create!(name: "Pinehurst No. 2", hole_count: 18, public: true)
        pinehurst_3 = GolfCourse.create!(name: "Pinehurst No. 3", hole_count: 18, public: true)
        saintandrews = GolfCourse.create!(name: "St. Andrews", hole_count: 72, public: true)
        augusta = GolfCourse.create!(name: "Augusta", hole_count: 18, public: false)
        
        visit "/golf_courses"
        
        expect(page).to have_content("Search by name:")
        fill_in :hole_name, with: "Pinehurst"
        click_button("Search")
        expect(current_path).to eq("/golf_courses")
        
        expect(page).to have_content(pinehurst.name)
        expect(page).to_not have_content(pinehurst_2.name)
        expect(page).to_not have_content(pinehurst_3.name)
        expect(page).to_not have_content(saintandrews.name)
        expect(page).to_not have_content(augusta.name)
    end

    it 'can search by name(partial match)' do 
        pinehurst_2 = GolfCourse.create!(name: "Pinehurst No. 2", hole_count: 18, public: true)
        pinehurst_3 = GolfCourse.create!(name: "Pinehurst No. 3", hole_count: 18, public: true)
        pinehurst_4 = GolfCourse.create!(name: "Pinehurst No. 4", hole_count: 18, public: true)
        saintandrews = GolfCourse.create!(name: "St. Andrews", hole_count: 72, public: true)
        augusta = GolfCourse.create!(name: "Augusta", hole_count: 18, public: false)
        visit "/golf_courses"
        
        expect(page).to have_content("Search by name:")
        fill_in :hole_name, with: "Pinehurst"
        click_button("Search")
        expect(current_path).to eq("/golf_courses")
        
        expect(page).to have_content(pinehurst_2.name)
        expect(page).to have_content(pinehurst_3.name)
        expect(page).to have_content(pinehurst_4.name)
        expect(page).to_not have_content(saintandrews.name)
        expect(page).to_not have_content(augusta.name)
    end

end