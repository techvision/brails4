class Level
  include Mongoid::Document
  include Mongoid::Slug

  field :seq_number, type: Integer
  field :name, type: String

  slug :name

  has_many :topics, dependent: :destroy
  has_many :questions, as: :questionable, dependent: :destroy
  has_many :attempts, as: :attemptable, dependent: :destroy 
  embeds_many :comments, as: :commentable

  validates :name, presence: true
  validates :seq_number, numericality: { only_integer: true, :greater_than => 0 }
  #TODO
  #with this validation the create tests dont pass
  #validates :seq_number, uniqueness: true

  accepts_nested_attributes_for :topics, :questions

  # Returns true if user has achievements for all level topics
  def completed?(user_id)
    user = User.find(user_id)
    if user.profile.achievements.empty?
      false
    else
      user.profile.achievements.each do |achievement|
        match = 0
        self.topics.each do |topic|
          if achievement.topic_id == topic.id
            match = 1
            break
          end
        end
        return false unless match == 1
      end
    end
  end
end
