require "rails_helper"

RSpec.feature "visit '/:branch_name' and see all scumbags for the branch" do
  scenario "visit '/senators' and see all senators" do
    senate = create(:branch, name: "Senate")
    supreme_court = create(:branch, name: "Supreme Court")
    scumbag_1, scumbag_2 = create_list(:scumbag, 2, branch: senate)
    scumbag_3 = create(:scumbag, branch: supreme_court)

    visit 'branches/senate'

    expect(page).to have_content(scumbag_1.name)
    expect(page).to have_content(scumbag_2.name)
    expect(page).to_not have_content(scumbag_3.name)
  end
end
