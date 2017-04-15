require 'rails_helper'

RSpec.feature "as an authenticated user" do

  scenario "they cannot view another user's private data" do
    user_1 = create(:user)
    user_2 = create(:user)

    user_1.orders << Order.create(total_price: 300)
    user_2.orders << Order.create(total_price: 8999)


    page.set_rack_session(user_id: user_1.id)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user_1)

    visit orders_path

    within('.scumbag-orders') do
      expect(page).to have_content("300")
      expect(page).to_not have_content("8999")
    end
  end
end

#
# title: Authenticated users security
#    body: >
#      Background: An authenticated user
#      As an Authenticated User
#      I cannot view another user's private data (current or past orders, etc)
#      I cannot view the administrator screens or use admin functionality
#      I cannot make myself an admin
