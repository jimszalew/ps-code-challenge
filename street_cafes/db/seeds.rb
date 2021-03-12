# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'csv'

CSV.foreach(Rails.root.join('lib', 'seeds', 'street_cafes_2020-21.csv'), headers: ['name', 'address', 'post_code', 'chairs', 'info']) do |row|
	Cafe.find_or_create_by(row.to_h)
    puts "#{row['name']} created!"
end

heads = Cafe.where(name: "Café/Restaurant Name")
heads.destroy_all