class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :omniauthable, omniauth_providers: [:google_oauth2]
  validates :nickname, presence: true, uniqueness: true

  has_many :sns_credentials
  has_many :clients,    dependent: :destroy
  has_many :quotations, dependent: :destroy
  has_many :minutes,    dependent: :destroy
  has_many :others,     dependent: :destroy
  has_many :bookmarks,  dependent: :destroy

  def self.from_omniauth(auth)
    sns  = SnsCredential.where(provider: auth.provider, uid: auth.uid).first_or_create
    user = sns.user || User.where(email: auth.info.email).first_or_initialize(
      nickname: auth.info.name,
         email: auth.info.email
    )
    if user.persisted?
      sns.user = user
      sns.save
    end
    { user: user, sns: sns }
  end
end
