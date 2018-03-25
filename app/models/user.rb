class User < ApplicationRecord

	attr_accessor :password, :password_confirmation
	validates :password, presence: true
	validates :password, confirmation: true
	before_save :bcrypt_password

	validates :name, :email, :password, presence: true
	validates :email, presence: true, uniqueness: true
	validates_format_of :email, with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i, on: :create
	has_many :posts, dependent: :destroy

	def bcrypt_password
		self.password_digest = BCrypt::Password.create(self.password)
 	end

 	def authenticate!
 		user = User.find(session[:user_id])
 		password == BCrypt::Password.new(user.password_digest)
 	end
end
