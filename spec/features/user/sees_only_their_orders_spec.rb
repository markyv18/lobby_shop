require 'rails_helper'

RSpec.feature "as an authenticated user with one order" do
  context "as user visits orders_path" do
    it "should only see their order" do
      order_1 = create(:order)
      order_2 = create(:order)
      scumbag_1 = create(:scumbag)
      scumbag_2 = create(:scumbag)
      scumbag_order_1 = ScumbagOrder.create(order_id: order_1.id, scumbag_id: scumbag_1.id, scumbag_quantity: 2, scumbag_price: scumbag_1.price)
      scumbag_order_2 = ScumbagOrder.create(order_id: order_2.id, scumbag_id: scumbag_2.id, scumbag_quantity: 3, scumbag_price: scumbag_2.price)
      user_1 = order_1.user
      user_2 = order_2.user

      page.set_rack_session(user_id: user_1.id)
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user_1)

      visit orders_path

      page.all(:css, ".order-id") do
        expect(page).to have_content(order_1.id)
        expect(page).to_not have_content(order_2.id)
      end

      page.all(:css, ".order-date") do
        expect(page).to have_content(order_1.created_at)
        expect(page).to_not have_content(order_2.created_at)
      end

      page.all(:css, ".order-price") do
        expect(page).to have_content(order_1.total_price)
        expect(page).to_not have_content(order_2.total_price)
      end
    end
  end
end
