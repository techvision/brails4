class Content
  include Mongoid::Document

  field :title, type: String
  field :title, type: String
  field :content_body, type: String
  field :sq_no, type: Integer
  field :transcript, type: String 
  
  belongs_to :topic
  has_many :questions
  
  embeds_many :questions, as: :questionable

end
