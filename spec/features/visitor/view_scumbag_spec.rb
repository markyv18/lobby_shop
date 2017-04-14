require 'rails_helper'

RSpec.describe "can visit scumbag view and see info for scumbag" do
  scenario "visit scumbags index and click on view" do
    scumbag = create(:scumbag)
    visit scumbags_path
    click_on "View"

    expect(current_path).to eq(scumbag_path(scumbag))
    expect(page).to have_content(scumbag.name)
  end
end