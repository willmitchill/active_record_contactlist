class Contact < ActiveRecord::Base
  validates :first_name, presence: true
  validates :first_name, length: { in: 2..25 }
  validates :last_name, presence: true
  validates :last_name, length: { in: 2..25 }
  validates :email, presence: true
  validates :email, length: { in: 4..30 }
  # validates :email, format: { with: /^([a-z0-9_\.-]+)@([\da-z\.-]+)\.([a-z\.]{2,6})$/,
  #   message: "only allows letters" }
end
