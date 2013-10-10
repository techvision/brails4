class Comment
  include Mongoid::Document

  field :text, type: String

  belongs_to :commentable, polymorphic: true

  validates :text, presence: true

end
