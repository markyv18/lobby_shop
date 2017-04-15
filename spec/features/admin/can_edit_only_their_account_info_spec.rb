require 'rails_helper'

RSpec.feature "as an admin" do

  scenario "I can edit only my account info and no other users" do
    user = create(:admin_user)
    user_2 = create(:user)
    user_2_init_name = user_2.username


    page.set_rack_session(user_id: user.id)

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    visit edit_admin_user_path(user.id)

    fill_in "user[username]", with: "adminupdated"
    fill_in "user[email]", with: "adminupdated@gmail.com"
    fill_in "user[password]", with: "hunter3"
    fill_in "user[password_confirmation]", with: "hunter3"

    click_on "Update Account"

    expect(current_path).to eq(admin_dashboard_path)

    within('.welcome-msg') do
      expect(page).to have_content("adminupdated")
    end

    visit edit_admin_user_path(user_2.id)

    fill_in "user[username]", with: "adminupdateduser2"
    fill_in "user[email]", with: "adminupdateduser2@gmail.com"
    fill_in "user[password]", with: "hunter4"
    fill_in "user[password_confirmation]", with: "hunter4"

    click_on "Update Account"

    expect(user_2.username).to eq(user_2_init_name)
  end
end
