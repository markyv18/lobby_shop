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

  
end
