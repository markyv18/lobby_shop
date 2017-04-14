# issue 8: items in cart added as a user are present after logging in

require "rails_helper"

RSpec.feature "As a visitor has items in their cart and visits '/cart'" do

  scenario "visitor does not see checkout button and sees login/or create account" do
    scumbag = create(:scumbag)
    page.set_rack_session(cart: {"1"=> 3})

    visit cart_index_path

    within('.scumbag-cart-item') do
      expect(page).to have_content(scumbag.name)
    end

    expect(page).to_not have_button("Checkout")

    expect(page).to have_content("Login or Create Account to Checkout")

    user = create(:user)
    page.set_rack_session(user_id: user.id)

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    visit cart_index_path

    within('.scumbag-cart-item') do
      expect(page).to have_content(scumbag.name)
    end

    click_on "Logout"

    within('.nav') do
      expect(page).to_not have_button("Logout")
      expect(page).to have_button("Login")
    end
  end
end
