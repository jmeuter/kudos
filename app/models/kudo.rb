class Kudo < ActiveRecord::Base
  belongs_to :primary_user, :class_name => 'User'
  belongs_to :kudos_user, :class_name => 'User'

  attr_accessible :honor, :kudos_user_id, :primary_user_id

  scope :primary_kudos, lambda { |user| where(primary_user_id: user.id, kudos_user_id: nil) }
end
