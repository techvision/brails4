require 'spec_helper'

describe Content do
  let(:level) { create(:full_level)}
  let(:content) { level.topics.first.contents.first }
  let(:profile){ create(:profile) }
  let(:question) { content.questions.first}
  let(:user) { profile.user}

  describe "Fields" do
    it { should have_field(:title).of_type(String)}
    it { should have_field(:transcript).of_type(String)}
    it { should have_field(:summary).of_type(String)}
    it { should have_field(:youtube_channel_url).of_type(String)}

#    it "has an embbebed mp3 audio file" do
#      expect(content).to validate_attachment_presence(:audio_mp3)
#    end

#    it "has and embbebed ogg audio file" do
#      expect(content).to validate_attachment_presence(:audio_ogg)
#    end
  end

  describe "Validations" do
    it 'has a valid factory' do
      expect(content).to be_valid
    end

#    it 'is invalid without a mp3 audio file' do
#      expect(build(:content, audio_mp3: nil)).not_to be_valid
#    end

#    it 'is invalid without a valid ogg audio file' do
#      expect(build(:content, audio_ogg: nil)).not_to be_valid
#    end

#    it 'validates the content type of mp3 audio file' do
#      expect(content).to validate_attachment_content_type(:audio_mp3).allowing('audio/mp3')
#    end

#    it 'validates the content type of ogg audio file' do
#      expect(content).to validate_attachment_content_type(:audio_ogg).allowing('audio/ogg')
#    end

#    it 'has a valid mp3 audio file' do
#      expect(build(:content, audio_mp3: fixture_file_upload("#{Rails.root}/spec/factories/support/Lighthouse.jpg", "image/jpg"))).to_not be_valid
#    end

#    it 'has a valid ogg audio file' do
#      expect(build(:content, audio_ogg: fixture_file_upload("#{Rails.root}/spec/factories/support/Lighthouse.jpg", "image/jpg"))).to_not be_valid
#    end

    it 'validates the lenght of Title' do
      expect(content).to validate_length_of(:title)
    end

    it 'is invalid without a title' do
      expect(build(:content, title: nil)).not_to be_valid
    end

    it 'is invalid without a transcript' do
      expect(build(:content, transcript: nil)).to_not be_valid
    end

    it 'is invalid without a summary' do
      expect(build(:content, summary: nil)).to_not be_valid
    end

    it 'is invalid without a youtube_channel_url' do
      expect(build(:content, youtube_channel_url: nil)).not_to be_valid
    end

    #TODO
    # Are questions necessary for all contents?
    
    #it 'is invalid without a question' do
    #  expect(build(:content, questions: nil)).to_not be_valid
    #end 
  end

  describe "Associations" do
    it 'has many questions' do
      expect(content).to have_many(:questions)
    end
    
    it 'has embedded comments' do
      expect(content).to embed_many(:comments)
    end
  end

  describe "Behavior" do
    describe "#complete?(user.id)" do
      context "when user has completed the content" do
        it "returns true" do
          attempt = build(:attempt, question_id: question.id, profile_id: profile.id, solved: true)
          profile.attempts << attempt

          expect(content.complete?(user.id)).to be_true
        end
      end

      context "when user has not completed the content" do
        it "returns false" do
          dummy_solved_attempt = create(:attempt, question_id: "dummy", profile_id: profile.id, solved: true)
          unsolved_attempt = create(:attempt, question_id: question.id, profile_id: profile.id, solved: false)
          
          profile.attempts << dummy_solved_attempt
          profile.attempts << unsolved_attempt

          expect(content.complete?(user.id)).to be_false
        end
      end
    end
  end
end
