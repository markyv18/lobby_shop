require 'rails_helper'

RSpec.feature "filter orders by status" do
  scenario "filter orders 'ordered'" do
    admin = create(:admin_user)
    user = create(:user_with_orders)
    ordered_order = Order.find_by(status: 'ordered')
    paid_order = Order.find_by(status: 'paid')
    cancelled_order = Order.find_by(status: 'cancelled')
    completed_order = Order.find_by(status: 'completed')
    page.set_rack_session(user_id: admin.id)

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)

    visit admin_dashboard_path

    within("div.table-width") do
      click_on 'Ordered'
    end

    expect(current_path).to eq(admin_dashboard_path)

    within('div.orders') do
      expect(page).to have_content(ordered_order.total_price)
      expect(page).to_not have_content(paid_order.total_price)
      expect(page).to_not have_content(cancelled_order.total_price)
      expect(page).to_not have_content(completed_order.total_price)
    end
  end

  scenario "filter orders 'paid'" do
    admin = create(:admin_user)
    user = create(:user_with_orders)
    ordered_order = Order.find_by(status: 'ordered')
    paid_order = Order.find_by(status: 'paid')
    cancelled_order = Order.find_by(status: 'cancelled')
    completed_order = Order.find_by(status: 'completed')
    page.set_rack_session(user_id: admin.id)

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)

    visit admin_dashboard_path

    within("div.table-width") do
      click_on 'Paid'
    end

    expect(current_path).to eq(admin_dashboard_path)

    within('div.orders') do
      expect(page).to have_content(paid_order.total_price)
      expect(page).to_not have_content(ordered_order.total_price)
      expect(page).to_not have_content(cancelled_order.total_price)
      expect(page).to_not have_content(completed_order.total_price)
    end
  end

  scenario "filter orders 'cancelled'" do
    admin = create(:admin_user)
    user = create(:user_with_orders)
    ordered_order = Order.find_by(status: 'ordered')
    paid_order = Order.find_by(status: 'paid')
    cancelled_order = Order.find_by(status: 'cancelled')
    completed_order = Order.find_by(status: 'completed')
    page.set_rack_session(user_id: admin.id)

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)

    visit admin_dashboard_path

    within("div.table-width") do
      click_on 'Cancelled'
    end

    expect(current_path).to eq(admin_dashboard_path)

    within('div.orders') do
      expect(page).to have_content(cancelled_order.total_price)
      expect(page).to_not have_content(paid_order.total_price)
      expect(page).to_not have_content(ordered_order.total_price)
      expect(page).to_not have_content(completed_order.total_price)
    end
  end

  scenario "filter orders 'completed'" do
    admin = create(:admin_user)
    user = create(:user_with_orders)
    ordered_order = Order.find_by(status: 'ordered')
    paid_order = Order.find_by(status: 'paid')
    cancelled_order = Order.find_by(status: 'cancelled')
    completed_order = Order.find_by(status: 'completed')
    page.set_rack_session(user_id: admin.id)

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)

    visit admin_dashboard_path

    within("div.table-width") do
      click_on 'Completed'
    end

    expect(current_path).to eq(admin_dashboard_path)

    within('div.orders') do
      expect(page).to have_content(completed_order.total_price)
      expect(page).to_not have_content(paid_order.total_price)
      expect(page).to_not have_content(ordered_order.total_price)
      expect(page).to_not have_content(cancelled_order.total_price)
    end
  end
end
