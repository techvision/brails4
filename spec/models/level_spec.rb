require 'spec_helper'

describe Level do
  context "Fields" do
    it { should have_field(:name).of_type(String)}
    it { should have_field(:seq_number).of_type(Integer)}
  end

  context "Validations" do
    it 'has a valid factory' do
      expect(build(:level)).to be_valid
    end

    describe 'has a valid name' do
      it { should_not allow_value("123@").for(:name) }
    end

    describe 'has a valid seq_number' do
      it { should validate_numericality_of(:seq_number).to_allow(:only_integer => true, :greater_than => 0) }
    end

    describe 'is invalid without a name' do
     it {should validate_presence_of(:name)}
    end

    describe 'is invalid without a seq_number' do
      it {should validate_presence_of(:seq_number)}
    end

    describe 'is invalid without a topic' do
      it {should validate_presence_of(:topics)}
    end
  end

  context "Associations" do
    it { should have_many(:topics) }
    it { should embed_many (:questions)}
  end

end
