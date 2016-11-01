class Tag
  include Mongoid::Document
  has_and_belongs_to_many :links
  belongs_to :user
  field :name, type: String
end
