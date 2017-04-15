require 'rails_helper'

RSpec.feature "Checkout Cart" do
  scenario "checkout out with items in cart" do
    user = create(:user)
    scumbag = create(:scumbag)
    page.set_rack_session(user_id: user.id, cart: {"1"=> 3})
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    visit cart_index_path
    click_on "Checkout"

    expect(current_path).to eq('/orders')
    expect(page).to have_content("Orders for #{user.username}")
    within('.orders') do
      expect(page).to have_content('ordered')
      expect(page).to have_content(scumbag.price * 3)
      expect(page).to have_content(user.orders.first.created_at)
    end
  end
end
