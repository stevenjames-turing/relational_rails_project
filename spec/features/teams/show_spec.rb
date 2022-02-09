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
  
  it 'displays total number of players for each team' do
    team_1 = Team.create(roster: 25, coach: true, league: "Avalanche")
    p1 = team_1.players.create(name: "MacKinnon", number: 29, injured: true)
    p2 = team_1.players.create(name: "Makar", number: 8, injured: false) 
    p4 = team_1.players.create(name: "Rantanen", number: 96, injured: false) 
    p5 = team_1.players.create(name: "Landeskog", number: 92, injured: false) 
    p6 = team_1.players.create(name: "Johnson", number: 6, injured: true) 

    visit "/teams/#{team_1.id}"
    
    expect(page).to have_content(5)
    expect(page).to_not have_content(4)
  end

  it 'has a link to Team_Players index page' do 
    team_1 = Team.create(roster: 25, coach: true, league: "Avalanche")
    p1 = team_1.players.create(name: "MacKinnon", number: 29, injured: true)
    p2 = team_1.players.create(name: "Makar", number: 8, injured: false) 
    p4 = team_1.players.create(name: "Rantanen", number: 96, injured: false) 

    visit "/teams/#{team_1.id}"

    expect(page).to have_link("Players")
    click_link("Players")
    expect(current_path).to eq("/teams/#{team_1.id}/players")
  end

  it 'can be updated with new info for attributes' do 
    team_1 = Team.create(roster: 25, coach: true, league: "Avalanche")
    p1 = team_1.players.create(name: "MacKinnon", number: 29, injured: true)
    p2 = team_1.players.create(name: "Makar", number: 8, injured: false)

    visit "/teams/#{team_1.id}"

    expect(page).to have_link("Update Team")
    click_link("Update Team")
    expect(current_path).to eq("/teams/#{team_1.id}/edit")

    fill_in :league, with: "Bruins"
    fill_in :roster, with: 28

    click_button("Submit")
    expect(current_path).to eq("/teams/#{team_1.id}")
    expect(page).to have_content("Bruins")
    expect(page).to have_content(28)
  end

  it 'can delete a team, and all players within' do
    team_1 = Team.create(roster: 25, coach: true, league: "Avalanche")
    team_2 = Team.create(roster: 23, coach: false, league: "Blues")
    p1 = team_1.players.create(name: "MacKinnon", number: 29, injured: true)
    p2 = team_1.players.create(name: "Makar", number: 8, injured: false)
    p6 = team_2.players.create(name: "Johnson", number: 6, injured: true) 

    visit "/teams/#{team_1.id}"

    expect(page).to have_link("Delete Team")
    click_link("Delete Team")
    expect(current_path).to eq("/teams")

    expect(page).to have_content("Blues")
    expect(page).to_not have_content("Avalanche")
  end
end