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
  
  it 'lists Teams by most recently created' do 
    team_1 = Team.create(roster: 25, coach: true, league: "Avalanche")
    team_2 = Team.create(roster: 23, coach: false, league: "Blues")
    team_3 = Team.create(roster: 36, coach: true, league: "Reds")

    visit "/teams"

    expect(team_3.league).to appear_before(team_2.league)
    expect(team_3.league).to appear_before(team_1.league)
    expect(team_1.league).to_not appear_before(team_2.league)
  end

  it 'has a link on every page' do 
    team_1 = Team.create(roster: 25, coach: true, league: "Avalanche")
    p1 = team_1.players.create(name: "MacKinnon", number: 29, injured: true)
    p2 = team_1.players.create(name: "Makar", number: 8, injured: false) 
    p4 = team_1.players.create(name: "Rantanen", number: 96, injured: false) 
    team_2 = Team.create(roster: 23, coach: false, league: "Blues")
    p3 = team_2.players.create(name: "Perron", number: 57, injured: false)
    p7 = team_2.players.create(name: "O'Reilly", number: 90, injured: false)
    p8 = team_2.players.create(name: "Saad", number: 20, injured: true)

    visit "/teams"

    expect(page).to have_link("Team Index")
  end
end