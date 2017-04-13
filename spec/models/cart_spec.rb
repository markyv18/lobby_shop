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
        it "returns an array of CartItems with the object and quantity" do
          scumbag = create(:scumbag)
          expect(cart.items).to be_an_instance_of(Array)
          expect(cart.items.first).to be_an_instance_of(CartItem)
          expect(cart.items.first.scumbag).to eq(scumbag)
        end

        it "returns multiple CartItems" do
          scumbag_1 = create(:scumbag)
          scumbag_2 = create(:scumbag)
          cart = build(:cart, initial_contents: ({"1" => 1, "2" => 1}))
          expect(cart.items.count).to eq(2)
        end
      end

      context "#items_total" do
        
      end
    end
  end
end
