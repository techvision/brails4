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

  def update_achievements(attempt)
    question = attempt.question
    questionable = question.questionable
    topic = question.find_topic
      
    unless topic.nil? then
      if topic.complete?(self.user_id)
        topic.attempts.inject { |acc,n| acc + n.points}
      end
    end
  end
end




#update achievements
#
# 
#   calcular os pontos do achievement:
#     para cada solved attempt do topic
#       somar os pontos 
#        
#   criar novo achievement para o usuario
#