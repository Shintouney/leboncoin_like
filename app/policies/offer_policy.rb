class OfferPolicy < ApplicationPolicy

  class Scope < Scope
    def resolve
      scope.where user_id: user.id
    end
  end

  def show?
    user&.id == record.user_id
  end

  def edit?
    user.id == record.user_id
  end

  def update?
    user.id == record.user_id
  end
end
