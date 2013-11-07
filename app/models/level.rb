class Level
  include Mongoid::Document

  field :seq_number, type: Integer
  field :name, type: String

  has_many :topics
  has_many :questions, as: :questionable
  embeds_many :comments, as: :commentable

  validates :name, :topics, presence: true
  validates :seq_number, numericality: { only_integer: true, :greater_than => 0 }

  accepts_nested_attributes_for :topics, :questions

  #TODO
  #Validar unicidade de seq_number
  #Colocar on dependent destroy para modelos com associacoes

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