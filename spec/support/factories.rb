FactoryGirl.define do

  scumbag_names = ['Tom Cotton',
                   'Lindsey Graham',
                   'Kelly Ayotte',
                   'Rand Paul',
                   'Claire McCaskill',
                   'Harry Reid',
                   'Marco Rubio',
                   'Mitch McConnell',
                   'Test_Scumbag_1',
                   'Test_Scumbag_2',
                   'Test_Scumbag_3']


  sequence :scumbag_name, scumbag_names.cycle do |n|
    "#{n}"
  end

  sequence :price do |n|
    n * 1234
  end

  sequence :total_price do |n|
    n * 2839
  end


  factory :scumbag do
    name { generate(:scumbag_name) }
    price
    party
    branch
    image_path 'senators/tim_kaine.png'
  end

  factory :retired_scumbag, class: Scumbag do
    name { generate(:scumbag_name) }
    price
    party
    branch
    image_path 'senators/tim_kaine.png'
    status 1
  end

  party_names = ['Democrat',
                 'Republican',
                 'Independent',
                 'Test',
                 'Test_2',
                 'Test_3',
                 'Test_4']

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

  sequence :username do |n|
    "user_#{n}"
  end

  sequence :email do |n|
    "user_#{n}@gmail.com"
  end

  factory :scumbag_order do
    order
    scumbag
    scumbag_quantity 3
    scumbag_price 400
  end

  factory :user do
    username
    email
    password "hunter2"

    factory :user_with_orders, class: User do

      transient do
        orders_count 5
      end
      after(:create) do |user, evaluator|
        create_list(:order, evaluator.orders_count, user: user)
      end
    end
  end


  factory :admin_user, class: User do
    username
    email
    password "hunter2"
    role 1
  end

  order_statuses = (0..3).to_a

  sequence :status, order_statuses.cycle do |n|
    n
  end

  factory :order do
    total_price
    status
    user
  end
end
