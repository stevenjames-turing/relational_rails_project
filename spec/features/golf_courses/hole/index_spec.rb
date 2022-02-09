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
    
    it 'sorts Holes alphabetically when link is clicked' do
        augusta = GolfCourse.create!(name: "Augusta", hole_count: 18, public: false)
        tea_olive = augusta.holes.create!(hazard: true, name: "Tea Olive", par: 4)
        pink_dogwood = augusta.holes.create!(hazard: true, name: "Pink Dogwood", par: 5)
        flowering_peach = augusta.holes.create!(hazard: false, name: "Flowering Peach", par: 4)
        crab_apple = augusta.holes.create!(hazard: true, name: "Flowering Crab Apple", par: 3)
        magnolia = augusta.holes.create!(hazard: true, name: "Magnolia", par: 4)
        
        visit "/golf_courses/#{augusta.id}/holes"
        
        expect(page).to have_link("Sort Alphabetically")
        expect(tea_olive.name).to appear_before(pink_dogwood.name)
        expect(pink_dogwood.name).to appear_before(flowering_peach.name)
        expect(flowering_peach.name).to appear_before(crab_apple.name)
        
        click_link("Sort Alphabetically")
        expect(current_path).to eq("/golf_courses/#{augusta.id}/holes")
        
        expect(crab_apple.name).to appear_before(magnolia.name)
        expect(pink_dogwood.name).to appear_before(tea_olive.name)
        expect(flowering_peach.name).to_not appear_before(flowering_peach.name)
    end
    
    it 'has links to edit each hole' do 
        augusta = GolfCourse.create!(name: "Augusta", hole_count: 18, public: false)
        tea_olive = augusta.holes.create!(hazard: true, name: "Tea Olive", par: 4)
        pink_dogwood = augusta.holes.create!(hazard: true, name: "Pink Dogwood", par: 5)
        flowering_peach = augusta.holes.create!(hazard: false, name: "Flowering Peach", par: 4)
        crab_apple = augusta.holes.create!(hazard: true, name: "Flowering Crab Apple", par: 3)
        magnolia = augusta.holes.create!(hazard: true, name: "Magnolia", par: 4)
        
        visit "/golf_courses/#{augusta.id}/holes"

        expect(page).to have_link("Edit")
        first(:link, "Edit").click
        expect(current_path).to eq("/holes/#{tea_olive.id}/edit")
    end

    it 'has links to delete each hole' do 
        augusta = GolfCourse.create!(name: "Augusta", hole_count: 18, public: false)
        tea_olive = augusta.holes.create!(hazard: true, name: "Tea Olive", par: 4)
        pink_dogwood = augusta.holes.create!(hazard: true, name: "Pink Dogwood", par: 5)
        crab_apple = augusta.holes.create!(hazard: true, name: "Flowering Crab Apple", par: 3)
        magnolia = augusta.holes.create!(hazard: true, name: "Magnolia", par: 4)
        
        visit "/golf_courses/#{augusta.id}/holes"
        
        expect(page).to have_link("Delete")
        first(:link, "Delete").click
        expect(current_path).to eq("/holes")
        
        expect(page).to_not have_content(tea_olive.name)
        expect(page).to have_content(pink_dogwood.name)
        expect(page).to have_content(crab_apple.name)
        expect(page).to have_content(magnolia.name)
    end
    
    it 'limits results to holes matching user-input criteria of par count' do
        augusta = GolfCourse.create!(name: "Augusta", hole_count: 18, public: false)
        tea_olive = augusta.holes.create!(hazard: true, name: "Tea Olive", par: 4)
        pink_dogwood = augusta.holes.create!(hazard: true, name: "Pink Dogwood", par: 5)
        crab_apple = augusta.holes.create!(hazard: true, name: "Flowering Crab Apple", par: 3)
        magnolia = augusta.holes.create!(hazard: true, name: "Magnolia", par: 4)
        juniper = augusta.holes.create!(hazard: false, name: "Juniper", par: 3)
        pampas = augusta.holes.create!(hazard: true, name: "Pampas", par: 4)
        yellow_jasmine = augusta.holes.create!(hazard: true, name: "Yellow Jasmine", par: 5)
        carolina_cherry = augusta.holes.create!(hazard: true, name: "Carolina Cherry", par: 4)

        visit "/golf_courses/#{augusta.id}/holes"

        fill_in :par, with: 4
        click_button("Submit")
        expect(current_path).to eq("/golf_courses/#{augusta.id}/holes")

        expect(page).to have_content(pink_dogwood.name)
        expect(page).to have_content(yellow_jasmine.name)
        expect(page).to_not have_content(tea_olive.name)
        expect(page).to_not have_content(juniper.name)
    end
    
    

end