class User < ApplicationRecord

    has_secure_password

    validates :email, presence: true
    validates :email, uniqueness: true
    validates_format_of :email, :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i
    validates :password, presence: true, if: :setting_password?

    def setting_password?
        password || password_confirmation
    end

end
