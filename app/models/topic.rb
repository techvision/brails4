class Topic
  include Mongoid::Document

  field :title, type: String
  field :seq_number, type: Integer

  belongs_to :level
  has_many :contents

  embeds_many :questions, as: :questionable

  validates :seq_number, :title, :contents, :presence => true
  validates :seq_number, :numericality => {:only_integer => true,  :greater_than => 0 }
  validates_format_of :title, :with => /[a-zA-Z]/, :message => "Invalid name format!"

end
