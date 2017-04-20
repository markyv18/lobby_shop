require 'csv'

DatabaseCleaner.strategy = :truncation
DatabaseCleaner.clean

party_names = ["Democrat", "Republican", "Independent", "Justice"]

party_names.each do |name|
  Party.create!(name: name)

  puts "Created #{name} Party"
end

senate_tag = "Bernie Not For Sale"
supreme_court_tag = "Presidents come and go, but the Supreme Court is forever"
executive_tag = "We have no idea what we're doing"
congress_tag = "Five dollars is five dollars..."



Branch.create(name: "Senate", image_path: "https://i.imgur.com/uIcmurx.jpg", tagline: senate_tag)
Branch.create(name: "Congress", image_path: "https://i.imgur.com/qFEZFqg.jpg", tagline: congress_tag)
Branch.create(name: "Supreme Court", image_path: "https://i.imgur.com/XeCnvES.jpg", tagline: supreme_court_tag)
Branch.create(name: "Executive", image_path: "https://i.imgur.com/bae5Ji6.jpg", tagline: executive_tag)

scumbags ||= (CSV.open'db/csv/scumbags.csv', headers: true, header_converters: :symbol)

scumbags.each do |scumbag|
  Scumbag.create(name:       scumbag[:name],
                 price:      scumbag[:price],
                 image_path: "http://i.imgur.com/IbB6JX5.jpg",
                 party:      Party.find_by(name: scumbag[:party]),
                 branch:     Branch.find_by(name: scumbag[:branch]))

  puts "Created #{scumbag[:name]}"
end
