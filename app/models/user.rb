class User < ApplicationRecord
  has_secure_password
  has_many :registrations, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :liked_events, through: :likes, source: :event 


  validates :name, presence: true
  validates :email, format: { with: /\S+@\S+/},
            uniqueness: { case_sensitive: false}
            validates :password, length: { minimum: 6, allow_blank: true }

end
