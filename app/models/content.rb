class Content
  include Mongoid::Document
  include Mongoid::Paperclip

  field :title, type: String
  field :body, type: String
  field :summary, type: String
  has_mongoid_attached_file :audio_mp3
  has_mongoid_attached_file :audio_ogg
  
  belongs_to :topic
  embeds_many :comments
  embeds_many :questions, as: :questionable

  validates :title, :body, :summary, :questions, presence: true
  validates :title, length: { maximum: 30 }
  validates_attachment :audio_mp3, :audio_ogg, presence: true
  validates_attachment :audio_mp3, content_type: {:content_type => ['audio/mpeg', 'audio/mp3']}
  validates_attachment :audio_ogg, content_type: {:content_type => ['audio/ogg', 'audio/ogg']}

end
