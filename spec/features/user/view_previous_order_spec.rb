# require 'rails_helper'

# RSpec.feature "View previous order" do
#     user = create(:user)
#     scumbag = create(:scumbag)
#     page.set_rack_session(user_id: user.id, cart: {"1"=> 3})
#     allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

#     visit cart_index_path
#     click_on "Checkout"
#     click_on "view"

#     expect(current_path).to eq(order_path(order))
# end
