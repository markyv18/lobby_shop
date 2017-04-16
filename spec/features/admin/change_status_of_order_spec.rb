require 'rails_helper'

RSpec.feature "Admin can update status of order" do
  scenario "admin can change status to canceled order status is 'Ordered'" do
    admin = create(:admin_user)
    order = create(:order, status: 0)
    user = order.user

    page.set_rack_session(user_id: admin.id)

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)

    visit admin_dashboard_path

    within('.order-status') do
      expect(page).to have_content("ordered")
    end
    within('.order-update') do
      expect(page).to have_button("Mark as Paid")
    end
    within('.order-update') do
      expect(page).to have_button("Cancel")
    end

    click_on 'Cancel'

    within('.order-status') do
      expect(page).to have_content("cancelled")
    end
  end

  scenario "admin can change status to 'paid' when order status is 'Ordered'" do
    admin = create(:admin_user)
    order = create(:order, status: 0)
    user = order.user

    page.set_rack_session(user_id: admin.id)

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)

    visit admin_dashboard_path

    within('.order-status') do
      expect(page).to have_content("ordered")
    end

    click_on 'Mark as Paid'

    within('.order-status') do
      expect(page).to have_content("paid")
    end
  end

  scenario "admin can change status to 'cancelled' when order status is 'paid'" do
    admin = create(:admin_user)
    order = create(:order, status: 1)
    user = order.user

    page.set_rack_session(user_id: admin.id)

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)

    visit admin_dashboard_path

    within('.order-status') do
      expect(page).to have_content("paid")
    end

    click_on 'Cancel'

    within('.order-status') do
      expect(page).to have_content("cancelled")
    end
  end

  scenario "admin can change status to 'completed' when order status is 'paid'" do
    admin = create(:admin_user)
    order = create(:order, status: 1)
    user = order.user

    page.set_rack_session(user_id: admin.id)

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)

    visit admin_dashboard_path

    within('.order-status') do
      expect(page).to have_content("paid")
    end

    click_on 'Mark as Completed'

    within('.order-status') do
      expect(page).to have_content("completed")
    end
  end
end