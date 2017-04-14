require 'rails_helper'

RSpec.feature "as an authenticated user with one order" do

  scenario "as user visits orders_path they should see only their orders" do
    order = create(:order_with_scumbags)

    user = order.user
    scumbag = order.scumbags.first
    first_scumbag_order = order.scumbag_orders.first
    first_scumbag_order.update_attributes(scumbag_quantity: 2, scumbag_price: 300)

    page.set_rack_session(user_id: user.id)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    visit orders_path


    click_on "View"
    expect(page).to have_content("Your order on #{order.format_created_date}.")
    expect(page).to have_content(first_scumbag_order.subtotal)
    expect(page).to have_content(scumbag.name)
    expect(page).to have_content(order.status.capitalize)
    expect(page).to have_content(order.total)
  end
end
