require 'rails_helper'


RSpec.describe User do

  it "has a valid factory" do
    expect(build(:user)).to be_valid
  end

  describe "Attributes" do
    it { expect(user).to respond_to(:username) }
    it { expect(user).to respond_to(:email) }
    it { expect(user).to respond_to(:password) }
  end


  let(:user) { build(:user) }

  describe "ActiveModel validations" do

     it { expect(user).to validate_presence_of(:username) }
     it { expect(user).to validate_presence_of(:email) }
     it { expect(user).to validate_uniqueness_of(:username) }
     it { expect(user).to validate_uniqueness_of(:email) }

  end

  describe "ActiveRecord associations" do
    it { expect(user).to have_many(:orders)}
  end

end
