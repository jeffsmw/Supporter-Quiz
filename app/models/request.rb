class Request < ApplicationRecord
  validates :name, presence: true
  validates :email, presence: true
  validates :department, presence: true
  validates :message, presence: true

  before_validation :set_defaults

  private

  def set_defaults
    self.status = "undone"
  end

end
