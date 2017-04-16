# issue 2: Visitor can view items

require 'rails_helper'

RSpec.feature "visitor can view scumbags", type: :feature do
  scenario "visit the scumbags page as a visitor and see all items" do
    scumbag_1, scumbag_2 = create_list(:scumbag, 2)

    visit scumbags_path

    expect(page).to have_content(scumbag_1.name)
    expect(page).to have_content(scumbag_1.party.name[0].upcase)
    expect(page).to have_content(scumbag_1.price)
    expect(page).to have_css("img[src*='#{scumbag_1.image_path}']")

    expect(page).to have_content(scumbag_2.name)
    expect(page).to have_content(scumbag_2.party.name[0].upcase)
    expect(page).to have_content(scumbag_2.price)
    expect(page).to have_css("img[src*='#{scumbag_2.image_path}']")
  end

  scenario "can see add to cart button" do
    scumbag = create(:scumbag)

    visit scumbags_path

    expect(page).to have_button("Add to Cart")
  end
end
