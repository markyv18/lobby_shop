RSpec.describe Party, :type => :model do
  subject { described_class.new }

  context 'attributes' do
    it 'has a name' do
      expect(subject).to respond_to(:name)
    end
  end

  context 'relationships' do
    it 'has scumbags' do
      expect(subject).to respond_to(:scumbags)
    end
  end

  context 'validations' do
    it 'is invalid without a name' do
      party = build(:party, name: nil)

      expect(party).to be_invalid
    end

    it 'cannot have the name same as another' do
      party_1 = create(:party)
      party_2 = build(:party, name: party_1.name)

      expect(party_2).to be_invalid
    end
  end
end
