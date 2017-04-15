require 'rails_helper'

RSpec.feature "as a user" do

  scenario "when visiting admin_dashboard_path I see a 404" do
    user = create(:user)

    page.set_rack_session(user_id: user.id)

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    visit admin_dashboard_path
    save_and_open_page
    expect(page).to have_content("The page you were looking for doesn't exist (404)")
  end
end
