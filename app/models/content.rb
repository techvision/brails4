class Content
  include Mongoid::Document
  include Mongoid::Paperclip

  field :title, type: String
  field :body, type: String
  field :summary, type: String
  has_mongoid_attached_file :audio_mp3
  has_mongoid_attached_file :audio_ogg
  
  belongs_to :topic
  embeds_many :comments, as: :commentable
  has_many :questions, as: :questionable

  validates :title, :body, :summary, presence: true #, :questions, presence: true
  validates :title, length: { maximum: 30 }
  validates_attachment :audio_mp3, :audio_ogg, presence: true
  validates_attachment :audio_mp3, content_type: {:content_type => ['audio/mpeg', 'audio/mp3']}
  validates_attachment :audio_ogg, content_type: {:content_type => ['video/ogg', 'audio/ogg', 'application/ogg', 'audio/x-vorbis+ogg']}

  #Returns true when the user has solved atempts for all the content questions
  def complete?(user_id)
    user = User.find(user_id)
    solved_attempts = user.profile.attempts.solved
    if solved_attempts.empty?
      return false
    else
      self.questions.each do |question|
        match = 0
        solved_attempts.each do |attempt|
          if attempt.question_id == question.id
            match = 1
            break
          end
        end
        return false unless match == 1
      end
      return true
    end
  end
end