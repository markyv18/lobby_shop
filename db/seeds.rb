require 'csv'

DatabaseCleaner.strategy = :truncation
DatabaseCleaner.clean

party_names = ["Democrat", "Republican", "Independant"]

party_names.each do |name|
  Party.create!(name: name)

  puts "Created #{name} Party"
end

branches = ["Senate", "Congress", "Supreme Court", "Executive"]

branches.each do |name|
  Branch.create(name: name)

  puts "Created #{name} branch"
end

scumbags ||= (CSV.open'db/csv/scumbags.csv', headers: true, header_converters: :symbol)

scumbags.each do |scumbag|
  Scumbag.create(name:       scumbag[:name],
                 price:      scumbag[:price],
                 image_path: scumbag[:image_path],
                 party:      Party.find_by(name: scumbag[:party]),
                 branch:     Branch.find_by(name: scumbag[:branch]))

  puts "Created #{scumbag[:name]}"
end