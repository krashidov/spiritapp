class Ability
  include CanCan::Ability

  def initialize(user)
    if user.has_role? :admin
      can :manage, :all
    elsif user.has_role? :editor
      can :manage, Careplan
      can :manage, Client
      can :manage, Provider
      can :read, :all
    else
      can :read, :all
    end
  end
end
