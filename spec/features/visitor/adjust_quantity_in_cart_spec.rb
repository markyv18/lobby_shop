# issue 6: visiter can adjust quantity of an item in the cart

require 'rails_helper'

RSpec.feature "adjust item in cart" do
  scenario "with item in cart visit cart index and adjust quantity, page updates to reflect quantity" do
    scumbag = create(:scumbag)
    visit '/scumbags'
    click_on 'Add to Cart'
    visit cart_index_path
    expect(page).to have_content(scumbag.name)


    select("10", :from => 'qty_update[quantity]')
    expect(current_path).to eq('/cart')
    expect(find_field('qty_update[quantity]').value).to eq("10")
  end
end
