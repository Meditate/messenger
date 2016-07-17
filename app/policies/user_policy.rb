class UserPolicy
  attr_reader :current_user, :model
  def initialize(current_user,model)
    @current_user=current_user
    @user=model
  end

  def index?

    @current_user.admin? or @current_user.editor?
  end

  def destroy?
    @current_user.admin?
  end

  def update?
    @current_user.admin?
  end

  def send_mail?
    @current_user.admin? or @current_user.editor?
  end

  def create?
    @current_user.admin?
  end
end
