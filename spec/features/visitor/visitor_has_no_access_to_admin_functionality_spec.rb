require 'rails_helper'

RSpec.feature "as a visitor" do

  scenario "they cannot view an admin path" do
    user = User.new(username:"Guest")

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    visit admin_scumbags_path

    expect(page).to have_content("The page you were looking for doesn't exist (404)")
  end
end

#
# title: Authenticated users security
#    body: >
#      Background: An authenticated user
#      As an Authenticated User
#      I cannot view another user's private data (current or past orders, etc)
#      I cannot view the administrator screens or use admin functionality
#      I cannot make myself an admin
