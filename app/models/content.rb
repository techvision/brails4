class Content
  include Mongoid::Document
  include Mongoid::Paperclip
  include Mongoid::Slug
  include Authority::Abilities

  field :title, type: String
  field :transcript, type: String
  field :summary, type: String
  field :youtube_channel_url, type: String 
#  has_mongoid_attached_file :audio_mp3
#  has_mongoid_attached_file :audio_ogg

  slug :title
  
  belongs_to :topic
  embeds_many :comments, as: :commentable
  has_many :questions, as: :questionable, dependent: :destroy

  validates :title, :transcript, :summary, presence: true #, :questions, presence: true
  validates :youtube_channel_url, presence: true
  validates :title, length: { maximum: 50 }
#  validates_attachment :audio_mp3, :audio_ogg, presence: true
#  validates_attachment :audio_mp3, content_type: {:content_type => ['audio/mpeg', 'audio/mp3']}
#  validates_attachment :audio_ogg, content_type: {:content_type => ['video/ogg', 'audio/ogg', 'application/ogg', 'audio/x-vorbis+ogg']}

  accepts_nested_attributes_for :questions

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
