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


  factory :order do
    total_price
    status 0
    user

    # factory :order_with_scumbags, class: Order do
    #
    #   transient do
    #     scumbags_count 1
    #   end
    #   after(:create) do |order, evaluator|
    #     create_list(:scumbag, evaluator.scumbags_count, orders: [order])
    #   end
    # end
  end
end
