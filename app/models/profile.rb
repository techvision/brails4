class Profile
  include Mongoid::Document

  field :name, type: String
  field :birthdate, type: Date
  field :gender, type: String
  field :address, type: String
  field :country, type: String
  field :total_points, type: Integer, default: 0

  belongs_to :user
  has_many :attempts
  embeds_many :achievements

  validates :name, :birthdate, :gender, :address, :country, presence: true

  #Checks profile achievements and level topics to see if user finished the previous topics
  def finished_previous_topics?(topic_id)
    topic = Topic.find(topic_id)
    level = topic.level
    seq_number = topic.seq_number

    level.topics.each do |level_topic|
      break if level_topic.seq_number >= seq_number
      return false if self.achievements.where(topic_id: level_topic.id).count == 0
    end
    true
  end

  def update_achievements(attempt)
    question = attempt.question
    questionable = question.questionable
    topic = question.find_topic
      
    unless topic.nil? then
      if topic.complete?(self.user_id)
        total_points = attempts_by_topic(attempt.question.find_topic).inject(0) { |acc,elem| acc. + elem.points}
        achievement = Achievement.new(score: total_points, created_at: Time.now, topic: topic)
        self.achievements << achievement
      end
    end
  end

  #Retuns all solved attempts the user has for questions belonging to the given topic or its contents
  def attempts_by_topic(topic_id)
    result,questions = [],[]
    topic = Topic.find(topic_id)
    attempts = self.attempts.solved

    #append all topic questions to questions array
    questions.concat(topic.questions)

    #appends all topic contents questions to questions array
    topic.contents.each do |content|
      questions.concat(content.questions)
    end

    attempts.each do |attempt|
      questions.each do |question|
        result << attempt if attempt.question == question
      end
    end
    #returns nil if there are no solved attempts
    result.empty? ? nil : result
  end

  def update_profile(attempt)
   self.inc(total_points: attempt.points)
   self.update_achievements(attempt)
   self.save
  end
end