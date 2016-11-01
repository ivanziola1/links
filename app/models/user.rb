class User
  include Mongoid::Document
  before_create :set_default_role
  has_many :links
  has_many :tags
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  ## Database authenticatable
  field :email,              type: String, default: ''
  field :encrypted_password, type: String, default: ''

  ## Recoverable
  field :reset_password_token,   type: String
  field :reset_password_sent_at, type: Time

  ## Rememberable
  field :remember_created_at, type: Time

  ## Trackable
  field :sign_in_count,      type: Integer, default: 0
  field :current_sign_in_at, type: Time
  field :last_sign_in_at,    type: Time
  field :current_sign_in_ip, type: String
  field :last_sign_in_ip,    type: String

  field :role, type: String
  def admin?
    role == 'admin'
  end

  def registered?
    role == 'registered'
  end

  protected

  def set_default_role
    self.role ||= 'registered'
  end
end
