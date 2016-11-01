class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new
    if user.admin?
      can :manage, :all
      can :access, :rails_admin
      can :dashboard
    elsif user.registered?
      can :read, :all
      can :create, [Link, Tag]
    end
  end
end
