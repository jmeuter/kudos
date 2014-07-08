class User < ActiveRecord::Base
  belongs_to :organization
  has_many :kudos, :class_name => 'Kudo', :foreign_key => 'primary_user_id' # our user with kudos to give
  has_many :kudos_awards, :class_name => 'Kudo', :foreign_key => 'kudos_user_id' # our achieved kudos user

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :organization_id, :first_name, :last_name,
                  :admin

  validates :email, :first_name, :last_name, presence: true
  validates_uniqueness_of :email

  def fullname
    "#{self.first_name} #{self.last_name}"
  end
end
