require 'spec_helper'

describe Level do
  let(:level) { create(:full_level)}
  let(:profile) { create(:profile)}
  let(:user) { profile.user}
  let(:topic) { level.topics.first}
  
  it{ should accept_nested_attributes_for(:topics)}

  describe "Fields" do
    it { should have_field(:name).of_type(String)}
    it { should have_field(:seq_number).of_type(Integer)}
  end

  describe "Validations" do
    it 'has a valid factory' do
      expect(level).to be_valid
    end

    it 'is invalid without a name' do
      expect(level).to validate_presence_of(:name)
    end
  end

  describe "Associations" do
    it 'has many topics' do 
      expect(level).to have_many(:topics) 
    end

    it 'has many embbebed questions' do 
      expect(level).to have_many(:questions)
    end
  end

  describe "Behavior" do
    describe "#complete?(user.id)" do
      it "returns true if the user completed the level" do
        achievement = build(:achievement, topic_id: topic.id)
        profile.achievements << achievement
        
        expect(level.completed?(user.id)).to be_true 
      end

      it "returns false if the user did not completed the level" do
        expect(level.completed?(user.id)).to be_false
      end
    end
  end
end
