class User < ActiveRecord::Base
    validates_uniqueness_of :user_id
    
    def self.create_user!(users)
        @session_token = SecureRandom.base64
        users['session_token'] = @session_token
        print("value for param in model#{users}")
        User.create!(users)      
    end
    
end