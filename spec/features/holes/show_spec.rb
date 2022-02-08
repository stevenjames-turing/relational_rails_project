require 'rails_helper'

RSpec.describe 'hole show page' do
    
    it 'displays hole by id with attributes' do 
        course_1 = GolfCourse.create(name: "Augusta", hole_count: 18, public: false)
        hole_1 = course_1.holes.create(hazard: true, name: "1st Hole", par: 4)
        hole_2 = course_1.holes.create(hazard: false, name: "2nd Hole", par: 5)
        
        visit "/holes/#{hole_1.id}"
        
        expect(page).to have_content(hole_1.par)
        expect(page).to have_content(hole_1.hazard)
        expect(page).to have_content(hole_1.name)
        expect(page).to_not have_content(hole_2.name)
    end

    it 'Holes can be updated with new info for their attributes' do 
        pinehurst = GolfCourse.create!(name: "Pinehurst No. 2", hole_count: 18, public: true)
        hole_1 = pinehurst.holes.create!(hazard: true, name: "The 1st Hole", par: 4)
        hole_2 = pinehurst.holes.create!(hazard: true, name: "The 2nd Hole", par: 4)
        hole_3 = pinehurst.holes.create!(hazard: false, name: "The 3rd Hole", par: 4)
        
        visit "/holes/#{hole_1.id}"
        
        expect(page).to have_link("Update Hole")
        click_link("Update Hole")
        expect(current_path).to eq("/holes/#{hole_1.id}/edit")
        
        fill_in :par, with: 7
        fill_in :name, with: "The Starting Hole"
        
        click_button("Submit")
        expect(current_path).to eq("/holes/#{hole_1.id}")
        expect(page).to have_content("The Starting Hole")
        expect(page).to have_content(7)
    end
    
    it 'has a link to delete Hole' do 
        pinehurst = GolfCourse.create!(name: "Pinehurst No. 2", hole_count: 18, public: true)
        hole_1 = pinehurst.holes.create!(hazard: true, name: "The 1st Hole", par: 4)
        hole_2 = pinehurst.holes.create!(hazard: true, name: "The 2nd Hole", par: 4)
        hole_4 = pinehurst.holes.create!(hazard: true, name: "The 4th Hole", par: 4)
        hole_6 = pinehurst.holes.create!(hazard: true, name: "The 6th Hole", par: 3)

        visit "/holes/#{hole_1.id}"
        
        expect(page).to have_link("Delete Hole")
        click_link("Delete Hole")
        expect(current_path).to eq("/holes")

        expect(page).to have_content(hole_2.name)
        expect(page).to have_content(hole_4.name)
        expect(page).to have_content(hole_6.name)
        expect(page).to_not have_content(hole_1.name)
    end
end