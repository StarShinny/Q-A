require 'active_record'
require 'yaml'
require 'logger'

class User < ActiveRecord::Base
  # To change this template use File | Settings | File Templates.
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

  validates :name, presence: true, length: {maximum: 30}
  validates :mail, presence: true, length: {maximum: 50}
  validates :password, presence: true, length: {maximum: 30}
end


