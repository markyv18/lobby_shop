# issue 7.1: visitor can see login

require 'rails_helper'

RSpec.feature "When accessing '/' as a visitor" do
  scenario "the visitor sees a form to enter credentials" do
    visit root_path

    expect(page).to have_button("Login")
    expect(page).to have_css ("#username")
    expect(page).to have_css ("#password")

  end

  scenario "and a link to create account" do

    visit root_path

    expect(page).to have_link("New? Create an Account",  href: 'users/new')
  end
end
