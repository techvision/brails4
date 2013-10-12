class Comment
  include Mongoid::Document

  field :text, type: String

  embedded_in :commentable, polymorphic: true

  validates :text, presence: true
end