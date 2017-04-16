require 'rails_helper'

RSpec.feature "View previous order" do
  scenario "add item to cart, redirects to orders and then view order" do
    user = create(:user)
    scumbag = create(:scumbag)
    page.set_rack_session(user_id: user.id, cart: {"1"=> 3})
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    visit cart_index_path
    click_on "Checkout"
    expect(current_path).to eq(orders_path)
    click_on "View"

    expect(current_path).to eq('/orders/1')
    within('.order-scumbag-name') do
      expect(page).to have_content(scumbag.name)
    end
    within('.order-scumbag-price') do
      expect(page).to have_content(scumbag.price)
    end
    within('.order-scumbag-quantity') do
      expect(page).to have_content("3")
    end
    within('.order-scumbag-subtotal') do
      expect(page).to have_content("#{3 * scumbag.price}")
    end
    within('.order-scumbag-total') do
      expect(page).to have_content("#{3 * scumbag.price}")
    end
  end
end
