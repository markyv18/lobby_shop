RSpec.describe Scumbag, :type => :model do
  subject { described_class.new }

  context 'attributes' do
    it 'has a name' do
      expect(subject).to respond_to(:name)
    end

    it 'has a price' do
      expect(subject).to respond_to(:price)
    end

    it 'has an image_path' do
      expect(subject).to respond_to(:image_path)
    end
  end

  context 'relationships' do
    it 'has a branch' do
      expect(subject).to respond_to(:branch)
    end

    it 'has a party' do
      expect(subject).to respond_to(:party)
    end
  end

  context 'validations' do
    it 'is invalid without a name' do
      scumbag = build(:scumbag, name: nil)

      expect(scumbag).to be_invalid
    end

    it 'cannot have the same name as another' do
      scumbag_1 = create(:scumbag)
      scumbag_2 = build(:scumbag, name: scumbag_1.name)

      expect(scumbag_2).to be_invalid
    end

    it 'is invalid without a price' do
      scumbag = build(:scumbag, price: nil)

      expect(scumbag).to be_invalid
    end

    it 'is invalid without an image_path' do
      scumbag = build(:scumbag, image_path: nil)

      expect(scumbag).to be_invalid
    end

    it 'is invalid without party' do
      scumbag = build(:scumbag, party: nil)

      expect(scumbag).to be_invalid
    end

    it 'is invalid without a branch' do
      scumbag = build(:scumbag, branch: nil)

      expect(scumbag).to be_invalid
    end
  end

  context "methods" do
    it "party_abbrevation returns first letter of party name in parens" do
      scumbag = create(:scumbag)
      scumbag_party = scumbag.party.name

      expect(scumbag.party_abbreviation).to eq("(#{scumbag_party[0]})")
    end
  end
end
