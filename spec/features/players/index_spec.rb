require 'rails_helper'

RSpec.describe 'players index page' do
  it 'displays players and their attributes' do
    team_1 = Team.create!(roster: 25, coach: true, league: "Avalanche")
    team_2 = Team.create!(roster: 23, coach: false, league: "Blues")
    team_3 = Team.create!(roster: 36, coach: true, league: "Reds")
    p1 = team_1.players.create!(name: "MacKinnon", number: 29, injured: true)
    p2 = team_1.players.create!(name: "Makar", number: 8, injured: true)
    p3 = team_2.players.create!(name: "Perron", number: 57, injured: true)

    visit "/players"

    expect(page).to have_content(p1.name)
    expect(page).to have_content(p1.number)
    expect(page).to have_content(p1.injured) 
    expect(page).to have_content(p2.name)
    expect(page).to have_content(p2.number)
    expect(page).to have_content(p2.injured)
    expect(page).to have_content(p3.name)
    expect(page).to have_content(p3.number)
    expect(page).to have_content(p3.injured)
    expect(page).to_not have_content(team_1.league)
  end

  it 'has a link on every page' do
    team_1 = Team.create(roster: 25, coach: true, league: "Avalanche")
    p1 = team_1.players.create(name: "MacKinnon", number: 29, injured: true)
    p2 = team_1.players.create(name: "Makar", number: 8, injured: false) 
    p4 = team_1.players.create(name: "Rantanen", number: 96, injured: false) 

    visit "/teams"

    expect(page).to have_link("Player Index")
    click_link("Player Index")
    expect(current_path).to eq("/players")
  end

  it 'only shows injured players' do
    team_1 = Team.create(roster: 25, coach: true, league: "Avalanche")
    p1 = team_1.players.create(name: "MacKinnon", number: 29, injured: true)
    p2 = team_1.players.create(name: "Makar", number: 8, injured: false) 
    p4 = team_1.players.create(name: "Rantanen", number: 96, injured: false) 

    visit "/players"

    expect(page).to have_content(p1.name)
    expect(page).to_not have_content(p2.name)
  end

  it 'allows user to update players' do
    team_1 = Team.create(roster: 25, coach: true, league: "Avalanche")
    p1 = team_1.players.create(name: "MacKinnon", number: 29, injured: true)
    p2 = team_1.players.create(name: "Makar", number: 8, injured: false) 
    p4 = team_1.players.create(name: "Rantanen", number: 96, injured: false) 

    visit "/players"

    expect(page).to have_link("Edit")
    click_link("Edit")
    expect(current_path).to eq("/players/#{p1.id}/edit")
  end
end