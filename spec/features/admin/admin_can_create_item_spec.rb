require 'rails_helper'

RSpec.feature "as an admin" do

  scenario "when visiting admin_dashboard_path I see the admin dashboard" do
    user = create(:admin_user)
    branch = Branch.create(name:"Executive", slug: "#{"Executive".parameterize}")
    party = Party.create(name:"Republican")
    page.set_rack_session(user_id: user.id)

    visit admin_scumbags_path

    click_on "Create New Scumbag"

    expect(current_path).to eq(new_admin_scumbag_path)

    fill_in 'scumbag[name]', with: "Tester Scumbag"
    fill_in 'scumbag[price]', with: 9001
    select(party.name, :from => 'scumbag_party_id')
    select(branch.name, :from => 'scumbag_branch_id')

    click_on "Create Scumbag"

    within('.flash-success') do
      expect(page).to have_content("Successfully created Tester Scumbag")
    end

    expect(Scumbag.last.name).to eq("Tester Scumbag")
  end
end
