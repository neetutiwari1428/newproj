class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # before_action :authenticate_user!
  after_save :set_username

  def set_username
    self.username ||= self.email.split('@').first + rand(1000).to_s if self.username.nil?
  end
end 
