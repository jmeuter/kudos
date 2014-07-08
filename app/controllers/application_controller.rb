class ApplicationController < ActionController::Base
  protect_from_forgery

  def after_sign_up_path_for(resource_or_scope)
    3.times do
      current_user.kudos.create
    end
  end
end
