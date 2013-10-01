class Content
  include Mongoid::Document

  belongs_to :topic
  has_many :questions
  
  embeds_many :questions, as: :questionable

end
