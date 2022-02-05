require 'rails_helper'

RSpec.describe 'golf course holes index page' do 
    it 'displays all holes and their attributes' do 
        augusta = GolfCourse.create!(name: "Augusta", hole_count: 18, public: false)
        tea_olive = augusta.holes.create!(hazard: true, name: "Tea Olive", par: 4)
        pink_dogwood = augusta.holes.create!(hazard: true, name: "Pink Dogwood", par: 5)
        flowering_peach = augusta.holes.create!(hazard: false, name: "Flowering Peach", par: 4)
        pinehurst = GolfCourse.create!(name: "Pinehurst No. 2", hole_count: 18, public: true)
        hole_1 = pinehurst.holes.create!(hazard: true, name: "The 1st Hole", par: 4)
        hole_2 = pinehurst.holes.create!(hazard: true, name: "The 2nd Hole", par: 4)
        hole_3 = pinehurst.holes.create!(hazard: false, name: "The 3rd Hole", par: 4)
        
        visit "/golf_courses/#{augusta.id}/holes"
        
        expect(page).to have_content(tea_olive.name)
        expect(page).to have_content(tea_olive.par)
        expect(page).to have_content(pink_dogwood.name)
        expect(page).to have_content(pink_dogwood.par)
        expect(page).to_not have_content(hole_1.name)
    end
    
    it 'can add new holes to the Golf Course' do 
        pinehurst = GolfCourse.create!(name: "Pinehurst No. 2", hole_count: 18, public: true)
        hole_1 = pinehurst.holes.create!(hazard: true, name: "The 1st Hole", par: 4)
        hole_2 = pinehurst.holes.create!(hazard: true, name: "The 2nd Hole", par: 4)
        hole_3 = pinehurst.holes.create!(hazard: false, name: "The 3rd Hole", par: 4)
        
        visit "/golf_courses/#{pinehurst.id}/holes"

        expect(page).to have_link("Create New Hole")
        click_link("Create New Hole")
        expect(current_path).to eq("/golf_courses/#{pinehurst.id}/holes/new")

        fill_in :name, with: "The 19th Hole"
        fill_in :par, with: 6
        select "false", :from => "hazard"

        click_button("Create Hole")
        expect(current_path).to eq("/golf_courses/#{pinehurst.id}/holes")
        expect(page).to have_content("The 19th Hole")
    end

end