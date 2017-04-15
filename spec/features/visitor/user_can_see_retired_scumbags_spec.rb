# issue 11: retired scumbags

# issueEleven:
#   title: Retired Items
#   body: >
#     As a user if I visit an item page and that item has been retired
#     Then I should still be able to access the item page
#     And I should not be able to add the item to their cart
#     And I should see in place of the "Add to Cart" button or link - "Item Retired"

require 'rails_helper'


RSpec.feature "a visitor viewing a retired scumbag" do
  it "should not be able to add scumbag to cart and button should state retired" do
    scumbag = create(:retired_scumbag)

    visit scumbag_path(scumbag)

    expect(page).to_not have_button("Add to Cart")

    
  end
end
