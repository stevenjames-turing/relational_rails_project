require 'rails_helper'

RSpec.describe 'hole show page' do
    
    it 'displays hole by id with attributes' do 
        course_1 = GolfCourse.create(name: "Augusta", hole_count: 18, public: false)
        hole_1 = course_1.holes.create(hazard: true, pin_location: "front", par: 4)
        hole_2 = course_1.holes.create(hazard: true, pin_location: "back", par: 5)
        
        visit "/holes/#{hole_1.id}"
        
        expect(page).to have_content(hole_1.par)
        expect(page).to have_content(hole_1.hazard)
        expect(page).to have_content(hole_1.pin_location)
        expect(page).to_not have_content(hole_2.pin_location)
    end
end