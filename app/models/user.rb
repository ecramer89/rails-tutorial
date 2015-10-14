class User < ActiveRecord::Base
    before_save {self.email=email.downcase}
    
    
    
    VALID_EMAIL_REGEX=/\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
    validates(:name, presence: true, length: {maximum: 50})
    validates(:email, presence: true, length: {maximum: 50}, uniqueness: {case_sensitive: false}, format: {with: VALID_EMAIL_REGEX})
    
    
    has_secure_password
    
end
