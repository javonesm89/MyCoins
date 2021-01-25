class User < ApplicationRecord
    validates :name, :presence => true 
    validates :email, :presence => true, :uniqueness => true
    validates :password, :presence => true, :length => {:minimum => 3}
    
    has_secure_password
end
