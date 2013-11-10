require 'spec_helper'

describe Profile do
  let(:level)  { create(:full_level)}
  let(:topic2) { create(:full_topic, seq_number: 2)}
  let(:profile){ create(:profile)}
  let(:topic)  { level.topics.first}
  let(:content) { topic.contents.first}
  let(:content_question) { content.questions.first}
  let(:topic_question) { topic.questions.first}
  let(:content_question_attempt) { build(:attempt, solved: true, points: content_question.difficulty, question: content_question)}
  let(:topic_question_attempt) { build(:attempt, solved: true, points: topic_question.difficulty, question: topic_question )}

  describe "Fields" do
    it "has a field called 'name'" do
      expect(profile).to have_field(:name).of_type(String)
    end

    it "has a field called 'birthdate'" do
      expect(profile).to have_field(:birthdate).of_type(Date)
    end

    it "has a field called 'gender'" do
      expect(profile).to have_field(:gender).of_type(String)
    end

    it "has a field called 'address'" do
      expect(profile).to have_field(:address).of_type(String)
    end

    it "has a field called 'country'" do
      expect(profile).to have_field(:country).of_type(String)
    end

    it "has a field called 'total_points" do
      expect(profile).to have_field(:total_points).of_type(Integer)
    end
  end

  describe "Validations" do
    it "has a valid factory" do
      expect(profile).to be_valid
    end

    it 'is invalid without a name' do
      expect(profile).to validate_presence_of(:name)
    end

    it 'is invalid without a birthdate' do
      expect(profile).to validate_presence_of(:birthdate)
    end

    it 'is invalid without a gender' do
      expect(profile).to validate_presence_of(:gender)
    end

    it 'is invalid without an address' do
      expect(profile).to validate_presence_of(:address)
    end

    it 'is invalid without a country' do
      expect(profile).to validate_presence_of(:country)
    end
  end

  describe "Associations" do
    it "belongs to an 'User'" do
      expect(profile).to belong_to(:user)
    end

    it "has many Attempts" do
      expect(profile).to have_many(:attempts)
    end

    it "embeds many Achievements" do
      expect(profile).to embed_many(:achievements)
    end
  end

  describe "Behavior" do
    #Checks profile achievements and level topics to see if user finished the previous topics
    describe "#finished_previous_topics?(topic_id)" do
      it "returns true when the user finished all the level previous topics" do
        achievement = build(:achievement, topic_id: topic.id)

        level.topics << topic2
        profile.achievements << achievement

        expect(profile.finished_previous_topics?(topic2.id)).to be_true
      end

      it "returns false when the user has not finished all the level previous topics" do
        level.topics << topic2

        expect(profile.finished_previous_topics?(topic2.id)).to be_false
      end
    end

    describe "#update_achievements(attempt)" do
      it "creates a new achievement record for the user" do
        profile.attempts << topic_question_attempt
        profile.attempts << content_question_attempt
        
        expect{profile.update_achievements(content_question_attempt)}.to change{profile.achievements.count}.by 1
      end

      it "creates an achievement for the finished topic" do
        profile.attempts << topic_question_attempt
        profile.update_achievements(topic_question_attempt)

        profile.attempts << content_question_attempt
        profile.update_achievements(content_question_attempt)

        expect(profile.achievements.last.topic).to eq topic
      end
    end

    describe "#attempts_by_topic(topic_id)" do
      context "when there are contents and topics questions attempts" do
        it "returns all solved attemtps" do
          profile.attempts << topic_question_attempt
          profile.attempts << content_question_attempt

          expect(profile.attempts_by_topic(topic.id)).to include topic_question_attempt
          expect(profile.attempts_by_topic(topic.id)).to include content_question_attempt
        end
      end

      context "when there are only contents questions attempts" do
        it "returns all solved attemtps" do
          profile.attempts << content_question_attempt

          expect(profile.attempts_by_topic(topic.id)).to eq [content_question_attempt]
        end
      end

      context "when there are only topic questions attempts" do
        it "returns all solved attemtps" do
          profile.attempts << topic_question_attempt

          expect(profile.attempts_by_topic(topic.id)).to eq [topic_question_attempt]
        end
      end

      context "when there are no attempts" do
        it "returns nil" do
          expect(profile.attempts_by_topic(topic.id)).to eq nil
        end
      end
    end

    describe "#update_profile(attempt)" do
      it "updates the profile points" do
        profile.attempts << topic_question_attempt

        expect{profile.update_profile(profile.attempts.first)}.to change{profile.total_points}.by 1
      end

      context "when user finished a topic" do
        it "creates a profile achievements" do
          profile.attempts << topic_question_attempt
          profile.attempts << content_question_attempt

          expect{profile.update_profile(topic_question_attempt)}.to change{profile.achievements.count}.by 1
        end
      end
    end
  end
end