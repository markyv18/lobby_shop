RSpec.describe Party, :type => :model do
  it "has a valid factory" do
    expect(build(:party)).to be_valid
  end

  let(:party) { build(:party) }

  describe "Attributes" do
    it { expect(party).to respond_to(:name) }
  end

  describe "ActiveModel validation" do
    it { expect(party).to validate_presence_of(:name) }
    it { expect(party).to validate_uniqueness_of(:name) }
  end

  describe "ActiveRecord associations" do
    it { expect(party).to have_many(:scumbags) }
  end
end
