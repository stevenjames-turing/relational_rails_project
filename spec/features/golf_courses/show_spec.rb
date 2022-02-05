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
    
    it 'displays total number of holes for each golf course' do
        augusta = GolfCourse.create!(name: "Augusta", hole_count: 18, public: false)
        tea_olive = augusta.holes.create!(hazard: true, name: "Tea Olive", par: 4)
        pink_dogwood = augusta.holes.create!(hazard: true, name: "Pink Dogwood", par: 5)
        flowering_peach = augusta.holes.create!(hazard: false, name: "Flowering Peach", par: 4)
        
        visit "/golf_courses/#{augusta.id}"

        expect(page).to have_content(3)
        expect(page).to_not have_content(4)
    end

    it 'has a link to Golf_Course_Holes index page' do 
        augusta = GolfCourse.create!(name: "Augusta", hole_count: 18, public: false)
        tea_olive = augusta.holes.create!(hazard: true, name: "Tea Olive", par: 4)
        pink_dogwood = augusta.holes.create!(hazard: true, name: "Pink Dogwood", par: 5)
        flowering_peach = augusta.holes.create!(hazard: false, name: "Flowering Peach", par: 4)

        visit "/golf_courses/#{augusta.id}"

        expect(page).to have_link("Holes")
        click_link("Holes")
        expect(current_path).to eq("/golf_courses/#{augusta.id}/holes")
    end

    it 'a Golf Course can be updated with new info for its attributes' do 
        pinehurst = GolfCourse.create!(name: "Pinehurst No. 2", hole_count: 18, public: true)
        hole_1 = pinehurst.holes.create!(hazard: true, name: "The 1st Hole", par: 4)
        hole_2 = pinehurst.holes.create!(hazard: true, name: "The 2nd Hole", par: 4)
        hole_3 = pinehurst.holes.create!(hazard: false, name: "The 3rd Hole", par: 4)

        visit "/golf_courses/#{pinehurst.id}"

        expect(page).to have_link("Update Golf Course")
        click_link("Update Golf Course")
        expect(current_path).to eq("/golf_courses/#{pinehurst.id}/edit")

        fill_in :hole_count, with: 36
        fill_in :name, with: "Pinecone No. 2"

        click_button("Submit")
        expect(current_path).to eq("/golf_courses/#{pinehurst.id}")
        expect(page).to have_content("Pinecone No. 2")
        expect(page).to have_content(36)


        # When I fill out the form with updated information
        # And I click the button to submit the form
        # Then a `PATCH` request is sent to '/parents/:id',
        # the parent's info is updated,
        # and I am redirected to the Parent's Show page where I see the parent's updated info
    end
end