class User < ActiveRecord::Base
  belongs_to :organization
  has_many :kudos, :class_name => 'Kudo', :foreign_key => 'primary_user_id' # our user with kudos to give
  has_many :kudos_awards, :class_name => 'Kudo', :foreign_key => 'kudos_user_id' # our achieved kudos user

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :organization_id, :first_name, :last_name,
                  :admin

  validates :email, :first_name, :last_name, presence: true
  validates_uniqueness_of :email

  def fullname
    "#{self.first_name} #{self.last_name}"
  end

  def self.add_kudos
    # collect all users regardless of organization
    users = User.all

    # loop through each user and add our kudos
    users.each do |user|

      #get our user kudos count
      kcount = Kudo.primary_kudos(user).count

      Log.info("#{user.email} already at max kudos. Skipping user.") if kcount == 3
      next if kcount == 3 # skip our user if we reached our max

      # set our variables
      i = kcount
      num = 3

      until i == num do
        Log.info("creating kudos for #{user.email}")
        user.kudos.create
        i +=1
      end

      Log.info("completed kudos creation for #{user.email}")

    end
  end

  def give_kudos(kudos_user)
    begin
      #

    rescue Exception => e
      Log.error("Kudos giving failed with: #{e.message}")
    end
  end

end
