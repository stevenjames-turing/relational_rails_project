require 'rails_helper'

RSpec.describe "teams index page" do
  it 'displays the name of all teams' do
    team_1 = Team.create(roster: 25, coach: true, league: "Avalanche")
    team_2 = Team.create(roster: 23, coach: false, league: "Blues")
    team_3 = Team.create(roster: 36, coach: true, league: "Reds")

    visit "/teams"

    expect(page).to have_content(team_1.league)
    expect(page).to have_content(team_2.league)
    expect(page).to have_content(team_3.league)
  end
end