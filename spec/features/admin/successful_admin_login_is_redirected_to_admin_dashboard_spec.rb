require 'rails_helper'

RSpec.feature "as an admin" do

  scenario "when logging in successfully they are redirected to the admin dashboard" do
    user = create(:admin_user)

    page.set_rack_session(user_id: user.id)

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    visit login_path

    fill_in "session[username]", with: user.username #admin account name created above
    fill_in "session[password]", with: "hunter2"
    click_on "Login"

    expect(current_path).to eq(admin_dashboard_path)
    expect(page).to have_content("Admin Dashboard")
  end
end
