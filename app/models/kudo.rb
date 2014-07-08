class Kudo < ActiveRecord::Base
  belongs_to :primary_user, :class_name => 'User'
  belongs_to :kudos_user, :class_name => 'User'

  attr_accessible :honor, :kudos_user_id, :primary_user_id
end
