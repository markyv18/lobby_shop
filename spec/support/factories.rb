FactoryGirl.define do

  scumbag_names = ['Tom Cotton',
                   'Lindsey Graham',
                   'Kelly Ayotte',
                   'Rand Paul',
                   'Claire McCaskill',
                   'Harry Reid',
                   'Marco Rubio',
                   'Mitch McConnell']

  sequence :scumbag_name, scumbag_names.cycle do |n|
    "#{n}"
  end

  sequence :price do |n|
    n * 1234
  end

  factory :scumbag do
    name { generate(:scumbag_name) }
    price
    party
    branch
    image_path 'senators/tim_kaine.png'
  end

  party_names = ['Democrat',
                 'Republican',
                 'Independant']

  sequence :party_name, party_names.cycle do |n|
    "#{n}"
  end

  factory :party do
    name { generate(:party_name) }
  end

  branch_names = ['Senate',
                  'House',
                  'Supreme Court',
                  'Executive']

  sequence :branch_name, branch_names.cycle do |n|
    "#{n}"
  end

  factory :branch do
    name { generate(:branch_name) }
    slug { "#{name.parameterize}" }
  end

  factory :cart, class: Cart do
    skip_create
    initial_contents { ({"1"=>1}) }
    initialize_with { new(initial_contents) }
  end
end
