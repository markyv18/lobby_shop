require 'rails_helper'

RSpec.feature "as a user created with a role of 1" do

  scenario "they are considered admin and have acces to admin view" do
    user = create(:admin_user)

    expect(user.admin?).to be(true)

    page.set_rack_session(user_id: user.id)

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    visit admin_scumbags_path

    expect(page).to have_content("Scumbags Admin View")
  end
end
