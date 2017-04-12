require 'rails_helper'

RSpec.feature "visitor is on home page", type: :feature do
  scenario "and when visiting category pages (index of branches) can then link to all officials in those categories" do
    official_1, official_2, official_3, official_4 = create_list(:official, 4)
    senate = official_1.branch

    visit branch_officials_path(senate)
    save_and_open_page
    expect(page).to have_content("Senate")
    expect(page).to have_content(official_1.name)

  end
end
