class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new
    public_send(user.role)
  end

  def guest
    can :read, Movie
  end

  def user
    guest

    can :create, Review
  end

  def admin
    can :manage, :all
  end
end
