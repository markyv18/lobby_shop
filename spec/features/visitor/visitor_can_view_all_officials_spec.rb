require 'rails_helper'

RSpec.feature "visitor can view officals", type: :feature do
  scenario "when visiting all officials(index) and sees all officials" do
    official_1, official_2 = create_list(:official, 2)

    visit officials_path
    save_and_open_page

    expect(page).to have_content(official_1.name)
    expect(page).to have_content(official_1.price)
    # expect(page).to have_content(official_1.party.name[0].upcase)
    # expect(page).to have_css("img[src*='/Users/MVA/mod2/projects/lobby_shop/public/assets/senators/tim_kaine-b872c655ac69e50a318e7fae321aa7af80edb9e09768e7ba8691d859e92ce69a.png']") #../
    expect(page).to have_content(official_2.name)
    expect(page).to have_content(official_2.price)
    # expect(page).to have_content(official_2.party.name[0].upcase)
    # expect(page).to have_css("img[src*='senators/tim_kaine.png']") #../

  end
end
