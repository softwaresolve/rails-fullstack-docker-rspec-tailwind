# frozen_string_literal: true

# ApplicationController
class ApplicationController < ActionController::Base
  def after_sign_in_path_for(resource)
    if resource.is_a?(AdminUser)
      admin_dashboard_path
    else
      super
    end
  end
end
