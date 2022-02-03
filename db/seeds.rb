# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
GolfCourse.destroy_all
Hole.destroy_all

augusta = GolfCourse.create!(name: "Augusta", hole_count: 18, public: false)
tea_olive = augusta.holes.create!(hazard: true, name: "Tea Olive", par: 4)
pink_dogwood = augusta.holes.create!(hazard: true, name: "Pink Dogwood", par: 5)
flowering_peach = augusta.holes.create!(hazard: false, name: "Flowering Peach", par: 4)
crab_apple = augusta.holes.create!(hazard: true, name: "Flowering Crab Apple", par: 3)
magnolia = augusta.holes.create!(hazard: true, name: "Magnolia", par: 4)
juniper = augusta.holes.create!(hazard: false, name: "Juniper", par: 3)
pampas = augusta.holes.create!(hazard: true, name: "Pampas", par: 4)
yellow_jasmine = augusta.holes.create!(hazard: true, name: "Yellow Jasmine", par: 5)
carolina_cherry = augusta.holes.create!(hazard: true, name: "Carolina Cherry", par: 4)

pinehurst = GolfCourse.create!(name: "Pinehurst No. 2", hole_count: 18, public: true)
hole_1 = pinehurst.holes.create!(hazard: true, name: "The 1st Hole", par: 4)
hole_2 = pinehurst.holes.create!(hazard: true, name: "The 2nd Hole", par: 4)
hole_3 = pinehurst.holes.create!(hazard: false, name: "The 3rd Hole", par: 4)
hole_4 = pinehurst.holes.create!(hazard: true, name: "The 4th Hole", par: 4)
hole_5 = pinehurst.holes.create!(hazard: false, name: "The 5th Hole", par: 5)
hole_6 = pinehurst.holes.create!(hazard: true, name: "The 6th Hole", par: 3)
hole_7 = pinehurst.holes.create!(hazard: true, name: "The 7th Hole", par: 4)
hole_8 = pinehurst.holes.create!(hazard: false, name: "The 8th Hole", par: 5)
hole_9 = pinehurst.holes.create!(hazard: true, name: "The 9th Hole", par: 3)
