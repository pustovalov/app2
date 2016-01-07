class Ability
  include CanCan::Ability
  def initialize(user)
    can :read, :all
    if user && user.is_admin?
      can :access, :rails_admin
      can :dashboard
      can :manage, :all
    end
  end
end