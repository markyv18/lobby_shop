# issue 4: visitor can add item to cart

require 'rails_helper'

RSpec.feature "visit '/scumbags' and add item to cart" do
  scenario "can click button and add item to cart" do
    scumbag = create(:scumbag)

    visit scumbags_path
    click_on "Add to Cart"
    
    within('.flash-notice') { expect(page).to have_content("Added #{scumbag.name} to cart.") }
  end

  scenario "can view cart after adding item and see item in cart" do
    scumbag = create(:scumbag)

    visit scumbags_path
    click_on "Add to Cart"
    click_on("cart")

    expect(current_path).to eq('/cart')
    expect(page).to have_content(scumbag.name)
    expect(page).to have_content(scumbag.price)
    expect(page).to have_content(scumbag.branch.name)
  end
end
