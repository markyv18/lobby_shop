require 'rails_helper'

RSpec.describe Cart, :type => :model do
  it 'has a valid factory' do
    expect(build(:cart)).to be_an_instance_of(Cart)
  end

  let(:cart) { build(:cart) }

  describe "instance methods" do
    context "responds to its methods" do
      it { expect(cart).to respond_to(:items) }
      it { expect(cart).to respond_to(:items_total) }
      it { expect(cart).to respond_to(:delete_scumbag) }
      it { expect(cart).to respond_to(:contents) }
      it { expect(cart).to respond_to(:total_count) }
      it { expect(cart).to respond_to(:add_item) }
      it { expect(cart).to respond_to(:count_of) }
      it { expect(cart).to respond_to(:update_quantity) }
    end

    context "executes methods properly" do
      context "#items" do
      end
    end

  end
end
