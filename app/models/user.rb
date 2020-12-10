class User < ApplicationRecord
  validates :email,  presence: true, uniqueness: true
  validates :name, presence: true

  has_many :tasks
end
