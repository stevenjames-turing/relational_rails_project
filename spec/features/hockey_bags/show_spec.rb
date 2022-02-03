require 'rails_helper'

RSpec.describe 'hockey_bag show page' do
  it 'shows the attributes of each hockey bag' do 
    bag_1 = HockeyBag.create(player: "Makar", pockets: 4, stinky: true)
    bag_2 = HockeyBag.create(player: "Landy", pockets: 2, stinky: false)

    visit "/hockey_bags/#{bag_1.id}"

    expect(page).to have_content(bag_1.player)
    expect(page).to have_content(bag_1.pockets)
    expect(page).to have_content(bag_1.stinky)
    expect(page).to_not have_content(bag_2.player)
  end
end