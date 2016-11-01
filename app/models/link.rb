class Link
  attr_accessor :labels
  include Mongoid::Document
  include Mongoid::Timestamps::Created
  has_and_belongs_to_many :tags
  belongs_to :user
  validates :hyperlink, presence: true
  # validates :hyperlink, format: { with: /https?:\/\/[\S]+/, message: 'Wrong format. Please start with "http" or "https" ' }
  field :hyperlink, type: String
  field :description, type: String
end
