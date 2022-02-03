require 'rails_helper'

RSpec.describe "hockey bags index page" do
  it 'displays the name of all hockey bags' do
    bag_1 = HockeyBag.create(player: "Makar", pockets: 4, stinky: true)
    bag_2 = HockeyBag.create(player: "Landy", pockets: 2, stinky: false)

    visit "/hockey_bags"

    expect(page).to have_content(bag_1.player)
    expect(page).to have_content(bag_2.player)
    expect(page).to_not have_content(bag_1.pockets)
  end
end