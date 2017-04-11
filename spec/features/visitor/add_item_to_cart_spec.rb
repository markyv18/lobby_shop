require 'rails_helper'

RSpec.feature "visit '/scumbags' and add item to cart" do
  scenario "can click button and add item to cart" do
    scumbag = create(:scumbag)

    visit scumbags_path
    click_on "Add to Cart"

    within('.flash-notice') { expect(page).to have_content("Added #{scumbag.name} to cart.") }
    # expect(page).to have_content("Cart: 1")
  end

  scenario "can view cart after adding item and see item in cart" do
    scumbag = create(:scumbag)

    visit scumbags_path
    click_on "Add to Cart"
    page.find(".fa-shopping-cart").click

    expect(current_path).to eq('/cart')
    expect(page).to have_content(scumbag.name)
    expect(page).to have_content(scumbag.price)
    expect(page).to have_content(scumbag.branch)
    # expect(page).to have_content('Quantity: 1')
    # test for css element image
    # total price
  end
end




  #   title: Adding items to the cart
  #   body: >
  #     Background: Items, and a user that is not logged in
  #     As a visitor
  #     When I visit any page with an item on it
  #     I should see a link or button for "Add to Cart"
  #     When I click "Add to cart" for that item
  #     And I click a link or button to view cart
  #     And my current path should be "/cart"
  #     And I should see a small image, title, description and price for the item I just added
  #     And there should be a "total" price for the cart that should be the sum of all items in the cart