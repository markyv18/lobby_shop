# require 'rails_helper'

# RSpec.feature "adjust item in cart" do
#   scenario "with item in cart visit cart index and adjust quantity, page updates to reflect quantity" do
#     pending
#     scumbag = create(:scumbag)
#     visit '/scumbags'
#     click_on 'Add to Cart'
#     visit cart_index_path
#     expect(page).to have_content(scumbag.name)

#     find("option[value='3']").click
#     expect(current_path).to eq('/cart')
#     should have_select('quantity')
#   end
# end

# issueSix:
#     title: Adjusting the quantity of an item in the cart
#     body: >
#       Background: My cart has an item in it
#       As a visitor
#       When I visit "/cart"
#       Then I should see my item with a quantity of 1
#       And when I increase the quantity
#       Then my current page should be '/cart'
#       And that item's quantity should reflect the increase
#       And the subtotal for that item should increase
#       And the total for the cart should match that increase
#       And when I decrease the quantity
#       Then my current page should be '/cart'
#       And that item's quantity should reflect the decrease
#       And the subtotal for that item should decrease
#       And the total for the cart should match that decrease