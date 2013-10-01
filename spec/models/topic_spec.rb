require 'spec_helper'

describe Topic do

  context 'Fields' do
    it { should have_field(:title).of_type(String) }
    it { should have_field(:seq_number).of_type(Integer) }
  end

  context 'Validations' do
    it 'has a valid factory' do
      expect(build(:topic)).to be_valid
    end

    describe 'has a valid title' do
      it { should_not allow_value("123@").for(:title) }
    end

    describe 'has at least one valid content' do
      pending "IMplement test"
    end

    describe 'has a valid seq_number' do
      it {should validate_numericality_of(:seq_number).to_allow(:only_integer => true, :greater_than => 0)}
    end

    describe 'its invalid without a title' do
      it {should validate_presence_of(:title)}
    end

    describe 'its invalid without a seq_number' do
      it {should validate_presence_of(:seq_number)}
    end

    describe 'its invalid without a content' do
      it { should validate_presence_of(:contents)}
    end
  end

  context 'Associations' do
    it {should embed_many(:questions)}
    it {should have_many(:contents)}
  end
end
