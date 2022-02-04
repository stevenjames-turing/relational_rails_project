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
end