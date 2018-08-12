class User < ApplicationRecord
	has_secure_password
	validates_uniqueness_of :username
	validates_uniqueness_of :email
	validates :username, :password, :email, presence: true


	has_many :pastes, dependent: :destroy
end
