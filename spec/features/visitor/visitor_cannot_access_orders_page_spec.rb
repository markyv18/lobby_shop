require 'rails_helper'

RSpec.feature "as a visitor" do

  scenario "they cannot view orders page" do

    user = User.new(username:"Guest")
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    visit orders_path

    expect(current_path).to eq(login_path)
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
