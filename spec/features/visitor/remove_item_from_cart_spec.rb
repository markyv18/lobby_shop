require 'rails_helper'

RSpec.feature "remove item from cart" do
  scenario "add item to cart, visit cart, remove item from cart" do
    scumbag = create(:scumbag)

    visit scumbags_path
    click_on "Add to Cart"
    click_on("cart")

    expect(current_path).to eq('/cart')
    expect(page).to have_content(scumbag.name)

    click_on "Remove"

    expect(current_path).to eq('/cart')
    expect(page).to have_content("Successfully removed the scumbag known as #{scumbag.name}!")
    within(".scumbag-cart-item") do
      expect(page).to_not have_content(scumbag.name)
    end
    expect(page).to_not have_content(scumbag.price)
    expect(page).to_not have_content(scumbag.branch.name)
  end
end


# issueFive:
#     title: Removing an item from my cart
#     body: >
#       Background: My cart has an item in it
#       As a visitor
#       When I visit "/cart"
#       And I click link "Remove"
#       Then my current page should be "/cart"
#       And I should see a message styled in green
#       And the message should say "Successfully removed SOME_ITEM from your cart."
#       And the title "SOME_ITEM" should be a link to that item in case the user wants to add it back
#       And I should not see the item listed in cart
