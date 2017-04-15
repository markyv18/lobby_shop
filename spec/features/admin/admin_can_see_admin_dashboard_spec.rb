require 'rails_helper'

RSpec.feature "as an admin" do

  scenario "when visiting admin_dashboard_path I see the admin dashboard" do
    user = create(:admin_user)

    page.set_rack_session(user_id: user.id)

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    visit admin_dashboard_path

    expect(page).to have_content("Admin Dashboard")
  end
end
