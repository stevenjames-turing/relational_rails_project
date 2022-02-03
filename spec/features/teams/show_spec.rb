require 'rails_helper'

RSpec.describe 'teams show page' do
  it 'displays a teams attributes' do  
    team_1 = Team.create(roster: 25, coach: true, league: "Avalanche")
    team_2 = Team.create(roster: 23, coach: false, league: "Blues")
    team_3 = Team.create(roster: 36, coach: true, league: "Reds")

    visit "/teams/#{team_1.id}"

    expect(page).to have_content(team_1.roster)
    expect(page).to have_content(team_1.coach)
    expect(page).to have_content(team_1.roster)
    expect(page).to_not have_content(team_2.league)
    expect(page).to_not have_content(team_3.league)
  end
end