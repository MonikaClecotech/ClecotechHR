class User < ApplicationRecord
  rolify
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable,
         :recoverable, :rememberable, :validatable,:omniauthable, omniauth_providers: [:google_oauth2]
  has_one :account, dependent: :destroy
  has_one :employee_salary, dependent: :destroy
  has_many :time_logs, dependent: :destroy
  belongs_to :organization    

  def self.from_omniauth(auth)
    if self.where(email: auth.info.email).exists? 
      where(email: auth.info.email).first.tap do |user|
        user.uid = auth.uid
        #user.image = auth.info.image # assuming the user model has an image
        user.token = auth.credentials.token
        user.expires = auth.credentials.expires
        user.expires_at = auth.credentials.expires_at
        user.refresh_token = auth.credentials.refresh_token
        user.save
      end
    end
  end

end
