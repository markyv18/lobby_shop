require 'rails_helper'


RSpec.describe Order do

  it "has a valid factory" do
    expect(build(:order)).to be_valid
  end

  let(:order) { build(:order) }

  describe "Attributes" do
    it { expect(order).to respond_to(:total_price) }
    it { expect(order).to respond_to(:status) }
    it { expect(order).to respond_to(:user_id) }
  end

  describe "ActiveModel validations" do
     it { expect(order).to validate_presence_of(:total_price) }
  end

  describe "ActiveRecord associations" do
    it { expect(order).to belong_to(:user)}
    it { expect(order).to have_many(:scumbag_orders)}
    it { expect(order).to have_many(:scumbags).through(:scumbag_orders)}
  end

  describe "instance methods" do
    context "responds to its methods" do
      it { expect(order).to respond_to(:add_items_to_order)}
    end

    context 'executes methods properly' do
      context '#add_items_to_order' do
        it "builds order items and adds them to order for each item in the cart" do
          cart = create(:cart)
          user = create(:user)
          scumbag = create(:scumbag)
          order = Order.create(total_price: cart.items_total, user_id: user.id)

          order.add_items_to_order(cart)

          expect(order.scumbags.first).to eq(scumbag)
          expect(order.total_price).to eq(scumbag.price)
        end
      end
    end
  end
end
