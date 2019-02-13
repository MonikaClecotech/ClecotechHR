class User < ApplicationRecord
  rolify
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,:omniauthable, omniauth_providers: [:google_oauth2]
  has_one :account, dependent: :destroy
  has_one :employee_salary, dependent: :destroy
  has_many :time_logs, dependent: :destroy
  belongs_to :organization    

  def self.from_omniauth(auth)
    where(email: auth.info.email).first_or_initialize.tap do |user|
      user.email = auth.info.email
      user.password = Devise.friendly_token[0,20]
      user.name = auth.info.name    # assuming the user model has a name
      #user.image = auth.info.image # assuming the user model has an image
      user.token = auth.credentials.token
      user.expires = auth.credentials.expires
      user.expires_at = auth.credentials.expires_at
      user.refresh_token = auth.credentials.refresh_token
      user.organization_id = 30
      user.save
    end
  end

end
