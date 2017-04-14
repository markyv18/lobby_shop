# issue 7.2: visitor can create account

require 'rails_helper'

RSpec.feature "as a visitor, when visiting '/' and clicking create account" do
  scenario "when entering correct credentials and clicking create, they are redirected to '/dashboard'" do
    visit root_path

    click_on "New? Create an Account"

    expect(current_path).to eq('/users/new')

    fill_in "user[username]", with: "Ryt11"
    fill_in "user[email]", with: "ryt11@gmail.com"
    fill_in "user[password]", with: "hunter2"
    fill_in "user[password_confirmation]", with: "hunter2"

    click_on "Create Account"

    expect(current_path).to eq('/dashboard')

    within ('.flash-success') do
      expect(page).to have_content("Logged in as Ryt11")
    end

    expect(page).to have_button("Logout")
    expect(page).to_not have_button("Login")
  end
end
