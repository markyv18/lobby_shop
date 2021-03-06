require 'rails_helper'

RSpec.feature "as an admin" do

  scenario "when visiting admin_dashboard_path I see orders with info about them" do
    admin = create(:admin_user)
    user = create(:user_with_orders)

    page.set_rack_session(user_id: admin.id)

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)

    visit admin_dashboard_path

    user.orders.each do |order|
      expect(page).to have_content(order.total_price)
    end

    within('.table-width') do
      expect(page).to have_content("Completed")
      expect(page).to have_content("Ordered")
      expect(page).to have_content("Paid")
      expect(page).to have_content("Cancelled")
      expect(page).to have_content("2")
      expect(page).to have_content("1")
    end
  end
end


# body: >
#   As an Admin
#   When I visit the dashboard
#   Then I can see a listing of all orders
#   And I can see the total number of orders for each status **("Ordered", "Paid", "Cancelled", "Completed")**
#   And I can see a link for each individual order
#   And I can filter orders to display by each status type  **("Ordered", "Paid", "Cancelled", "Completed")**
#   And I have links to transition between statuses
#     - I can click on "cancel" on individual orders which are "paid" or "ordered"
#     - I can click on "mark as paid" on orders that are "ordered"
#     - I can click on "mark as completed" on orders that are "paid"
