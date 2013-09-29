class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new
    public_send(user.role)
  end

  def guest
  end

  def user
    guest
  end

  def admin
    can :manage, :all
  end
end
