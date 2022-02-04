require 'rails_helper'

RSpec.describe 'teams player index page' do
  it 'displays each player and their attributes' do
    team_1 = Team.create!(roster: 25, coach: true, league: "Avalanche")
    team_2 = Team.create!(roster: 23, coach: false, league: "Blues")
    team_3 = Team.create!(roster: 36, coach: true, league: "Reds")
    p1 = team_1.players.create!(name: "MacKinnon", number: 29, injured: true)
    p2 = team_1.players.create!(name: "Makar", number: 8, injured: false)
    p3 = team_2.players.create!(name: "Perron", number: 57, injured: false)

    visit "/teams/#{team_1.id}/players"

    expect(page).to have_content(p1.name)
    expect(page).to have_content(p1.injured)
    expect(page).to have_content(p1.number)
    expect(page).to have_content(p2.name)
    expect(page).to_not have_content(p3.name)
  end
end