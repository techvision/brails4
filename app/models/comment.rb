class Comment
  include Mongoid::Document

  field :text, type: String

  belongs_to :commentable, polymorphic: true
  belongs_to :profile

  validates :text, presence: true
end