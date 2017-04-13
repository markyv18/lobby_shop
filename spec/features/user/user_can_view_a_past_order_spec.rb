require 'rails_helper'

RSpec.feature "as an authenticated user with one order" do

  scenario "as user visits orders_path they should see only their orders" do
    order = create(:order)
    user = order.user

    page.set_rack_session(user_id: user.id)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    visit orders_path

    expect(page).to have_content("Your Orders")
    expect(page).to have_content(order.price)

    click_on "View"

    #expect to have all item names in the order
    #with quantity and line item subtotals
    #each item should have a link to their showpage
    #show status of order
    #and total of order
    #and date order was submitted
    #order completed or cancelled?
    #and see when that status change took place (updated_at)
    

  end
end
