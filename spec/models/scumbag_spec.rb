RSpec.describe Scumbag, :type => :model do
  it 'has a valid factory do' do
    expect(build(:scumbag)).to be_valid
  end

  let(:scumbag) { build(:scumbag) }

  describe "Attributes" do
    it { expect(scumbag).to respond_to(:name) }
    it { expect(scumbag).to respond_to(:price) }
    it { expect(scumbag).to respond_to(:image_path) }
    it { expect(scumbag).to respond_to(:party) }
    it { expect(scumbag).to respond_to(:branch) }
  end

  describe "ActiveModel validations" do
    it { expect(scumbag).to validate_presence_of(:name) }
    it { expect(scumbag).to validate_uniqueness_of(:name) }
    it { expect(scumbag).to validate_presence_of(:price) }
    it { expect(scumbag).to validate_presence_of(:image_path) }
    it { expect(scumbag).to validate_presence_of(:party).with_message("must exist") }
    it { expect(scumbag).to validate_presence_of(:branch).with_message("must exist") }
  end

  describe "ActiveRecord associations" do
    it { expect(scumbag).to belong_to(:branch)}
    it { expect(scumbag).to belong_to(:party)}
  end

  describe "instance method" do
    let(:party)   { build(:party, name: "Democrat") }
    let(:scumbag) { build(:scumbag, party: party ) }

    context "responds to its methods" do
      it { expect(scumbag).to respond_to(:party_abbreviation)}
    end

    context "it executes it's methods properly" do
      it { expect(scumbag.party_abbreviation).to eq("(D)") }
    end
  end
end
