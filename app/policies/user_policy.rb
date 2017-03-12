class UserPolicy


  def index?
    true
  end

  def show?
    index?
  end

  def update_positions?
    user.has_role?(Role.where(label: ['System Admin', 'Organization Admin', 'User Admin']))
  end

  def update?
    update_positions? or user == record
  end

  def show_private_info?
    update?
  end

end
