require 'bcrypt'

class User < ApplicationRecord
  has_many :linkbooks
  include BCrypt
    

    def password
      @password ||= Password.new(hashed_password)
    end
    
    def password=(new_password)
      @password = Password.create(new_password)
      self.hashed_password = @password
    end
end
