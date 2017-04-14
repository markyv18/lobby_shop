# issue 9: viewing past orders

require 'rails_helper'

RSpec.feature "as an authenticated user with multiple orders" do

  scenario "as user visits orders_path they should see only their orders" do
    user = create(:user_with_orders)
    order = create(:order)

    page.set_rack_session(user_id: user.id)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    visit orders_path

    user.orders.each do |order|
      expect(page).to have_content(order.price)
    end
    expect(page).to_not have_content(order.price)
    expect(page).to have_content("Your Orders")
  end
end
