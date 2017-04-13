require 'rails_helper'

RSpec.describe Branch, :type => :model do
  it 'has a valid factory' do
    expect(build(:branch)).to be_valid
  end

  let(:branch) { build(:branch) }

  describe "Attributes" do
    it { expect(branch).to respond_to(:name) }
  end

  describe "ActiveModel validations" do
    it { expect(branch).to validate_presence_of(:name) }
    # it { expect(branch).to validate_uniqueness_of(:name) }
    # it { expect(branch).to validate_presence_of(:slug) }
  end

  describe "ActiveRecord associations" do
    it { expect(branch).to have_many(:scumbags) }
  end

  context "Callbacks" do
    let(:branch) { create(:branch) }

    it { expect(branch).to callback(:generate_slug).before(:validation) }
  end

  describe "instance methods" do
    context "responds to its methods" do
      it { expect(branch).to respond_to(:to_param) }
      it { expect(branch).to respond_to(:generate_slug)}
    end

    context "executes methods correctly" do
      context "#to_param" do
        it "returns the slug" do
          expect(branch.to_param).to eq("#{branch.name.parameterize}")
        end
      end

      context "#generate_slug" do
        it "parameterizes the name of the branch" do
          expect(branch.generate_slug).to eq("#{branch.name.parameterize}")
        end
      end
    end
  end

  describe "class methods", Branch do
    let(:branch) { create(:branch) }

    context "it responds to its methods" do
      it { expect(Branch).to respond_to(:find) }
    end

    context ".find" do
      it { expect(Branch.find(branch.slug)).to eq(branch) }
    end
  end
end
