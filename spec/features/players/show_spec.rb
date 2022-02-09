require 'rails_helper'

RSpec.describe 'players show page' do
  it 'displays a player with their attributes' do
    team_1 = Team.create(roster: 25, coach: true, league: "Avalanche")
    team_2 = Team.create(roster: 23, coach: false, league: "Blues")
    team_3 = Team.create(roster: 36, coach: true, league: "Reds")
    p1 = team_1.players.create(name: "MacKinnon", number: 29, injured: true)
    p2 = team_1.players.create(name: "Makar", number: 8, injured: false)
    p3 = team_2.players.create(name: "Perron", number: 57, injured: false)

    visit "/players/#{p1.id}"

    expect(page).to have_content(p1.name)
    expect(page).to have_content(p1.number)
    expect(page).to have_content(p1.injured)
    expect(page).to_not have_content(p2.name)
    expect(page).to_not have_content(p3.name)
  end

  it 'updates the players' do
    team_1 = Team.create(roster: 25, coach: true, league: "Avalanche")
    team_2 = Team.create(roster: 23, coach: false, league: "Blues")
    team_3 = Team.create(roster: 36, coach: true, league: "Reds")
    p1 = team_1.players.create(name: "MacKinnon", number: 29, injured: true)
    p2 = team_1.players.create(name: "Makar", number: 8, injured: false)
    p3 = team_2.players.create(name: "Perron", number: 57, injured: false)

    visit "/players/#{p1.id}"

    expect(page).to have_link("Update Player")
    click_link("Update Player")
    expect(current_path).to eq("/players/#{p1.id}/edit")

    fill_in :name, with: "MacK"
    fill_in :number, with: 22

    click_button("Submit")
    expect(current_path).to eq("/players/#{p1.id}")
  end

  it 'deletes player' do
    team_1 = Team.create(roster: 25, coach: true, league: "Avalanche")
    team_2 = Team.create(roster: 23, coach: false, league: "Blues")
    p1 = team_1.players.create(name: "MacKinnon", number: 29, injured: true)
    p2 = team_1.players.create(name: "Makar", number: 8, injured: true)
    p3 = team_2.players.create(name: "Perron", number: 57, injured: true)

    visit "/players/#{p1.id}"

    expect(page).to have_link("Delete Player")
    click_link("Delete Player")
    expect(current_path).to eq("/players")

    expect(page).to have_content(p2.name)
    expect(page).to have_content(p3.name)
    expect(page).to_not have_content(p1.name)
  end
end
