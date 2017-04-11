RSpec.describe Branch, :type => :model do
  subject { described_class.new }

  context 'attributes' do
    it 'has a name' do
      expect(subject).to respond_to(:name)
    end
  end

  context 'relationships' do
    it "has scumbags" do
      expect(subject).to respond_to(:scumbags)
    end
  end

  context 'validations' do
    it "is invalid without a name" do
      branch = build(:branch, name: nil, slug: "test")

      expect(branch).to be_invalid
    end

    it "cannot have the name same as another" do
      branch_1 = create(:branch)
      branch_2 = build(:branch, name: branch_1.name)

      expect(branch_2).to be_invalid
    end

    it "is invalid without a slug" do
      pending
      branch = build(:branch, slug: nil)

      expect(branch).to be_invalid
    end
  end
end
