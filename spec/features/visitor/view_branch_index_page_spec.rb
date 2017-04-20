require 'rails_helper'

RSpec.feature "visit '/branches' and see a list of all available branches" do
  scenario "visit branches" do
    senate = create(:branch, name: "Senate")
    supreme_court = create(:branch, name: "Supreme Court")
    congress = create(:branch, name: "Congress")

    visit branches_path

    expect(page).to have_content("Senate")
    expect(page).to have_content("Supreme Court")
    expect(page).to have_content("Congres")
  end
end
