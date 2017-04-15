require 'rails_helper'


RSpec.describe ScumbagOrder do

  let(:scumbag_order) { build(:scumbag_order) }


  describe "Attributes" do
    it { expect(scumbag_order).to respond_to(:scumbag_id) }
    it { expect(scumbag_order).to respond_to(:order_id) }
    it { expect(scumbag_order).to respond_to(:scumbag_quantity) }
    it { expect(scumbag_order).to respond_to(:scumbag_price) }
  end

  describe "ActiveModel validations" do
     it { expect(scumbag_order).to validate_presence_of(:scumbag_quantity) }
     it { expect(scumbag_order).to validate_presence_of(:scumbag_price) }
  end

  describe "ActiveRecord associations" do
    it { expect(scumbag_order).to belong_to(:order) }
    it { expect(scumbag_order).to belong_to(:scumbag) }
  end

  describe "instance method" do

    context "responds to its methods" do
      it { expect(scumbag_order).to respond_to(:subtotal)}
      it { expect(scumbag_order).to respond_to(:scumbag_name)}
    end

    context "it executes it's methods properly" do
      it { expect(scumbag_order.subtotal).to eq(1200) }
    end
  end

end
