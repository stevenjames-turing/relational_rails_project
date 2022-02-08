require 'rails_helper'

RSpec.describe 'hole index page' do
    it 'displays attributes of each hole' do 
        course_1 = GolfCourse.create(name: "Augusta", hole_count: 18, public: false)
        hole_1 = course_1.holes.create(hazard: true, name: "1st Hole", par: 4)
        hole_2 = course_1.holes.create(hazard: true, name: "2nd Hole", par: 5)

        visit "/holes"

        expect(page).to have_content(hole_1.par)
        expect(page).to have_content(hole_1.hazard)
        expect(page).to have_content(hole_1.name)
        expect(page).to have_content(hole_2.par)
        expect(page).to have_content(hole_2.hazard)
        expect(page).to have_content(hole_2.name)
        expect(page).to_not have_content(course_1.name)
    end

    it 'has a link on every page' do 
        pinehurst = GolfCourse.create!(name: "Pinehurst No. 2", hole_count: 18, public: true)
        hole_1 = pinehurst.holes.create!(hazard: true, name: "The 1st Hole", par: 4)
        hole_2 = pinehurst.holes.create!(hazard: true, name: "The 2nd Hole", par: 4)
        hole_3 = pinehurst.holes.create!(hazard: false, name: "The 3rd Hole", par: 4)

        visit "/golf_courses"
        
        expect(page).to have_link("Hole Index")
        click_link("Hole Index")
        expect(current_path).to eq("/holes")
    end

    it 'only displays holes with hazard = true' do 
        pinehurst = GolfCourse.create!(name: "Pinehurst No. 2", hole_count: 18, public: true)
        hole_1 = pinehurst.holes.create!(hazard: true, name: "The 1st Hole", par: 4)
        hole_2 = pinehurst.holes.create!(hazard: true, name: "The 2nd Hole", par: 4)
        hole_3 = pinehurst.holes.create!(hazard: false, name: "The 3rd Hole", par: 4)
        
        visit "/holes"
        
        expect(page).to have_content("The 1st Hole")
        expect(page).to have_content("The 2nd Hole")
        expect(page).to_not have_content("The 3rd Hole")
    end
    
    it 'has links to edit each hole' do 
        pinehurst = GolfCourse.create!(name: "Pinehurst No. 2", hole_count: 18, public: true)
        hole_1 = pinehurst.holes.create!(hazard: true, name: "The 1st Hole", par: 4)
        hole_2 = pinehurst.holes.create!(hazard: true, name: "The 2nd Hole", par: 4)
        hole_3 = pinehurst.holes.create!(hazard: false, name: "The 3rd Hole", par: 4)
        
        visit "/holes"

        expect(page).to have_link("Edit")
        first(:link, "Edit").click
        expect(current_path).to eq("/holes/#{hole_1.id}/edit")
    end
end