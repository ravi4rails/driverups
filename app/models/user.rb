class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :omniauthable, :omniauthable, :omniauth_providers => [:facebook, :google_oauth2]
  
  has_one :agency
  has_many :bookings
  after_create :assign_default_role
  
  ROLES = ["admin, guest"] 
  
  def assign_default_role
    self.update(role: "guest") unless self.admin?
  end

  def admin?
    self.role == "admin"    
  end

  def self.new_with_session(params, session)
    super.tap do |user|
      if data = session["devise.facebook_data"] && session["devise.facebook_data"]["extra"]["raw_info"]
        user.email = data["email"] if user.email.blank?
      end
    end
  end

  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.first_name = auth.info.name
      user.email = auth.info.email
      user.password = Devise.friendly_token[0,20]
    end
  end

  def nickname
    email.split("@")[0].capitalize
  end
end
