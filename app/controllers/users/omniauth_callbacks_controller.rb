# frozen_string_literal: true

# Users::OmniauthCallbacksController

module Users
  # OmniauthCallbacksController
  class OmniauthCallbacksController < Devise::OmniauthCallbacksController
    def facebook
      Rails.logger.debug "Request env omniauth.auth: #{request.env['omniauth.auth']}"

      # You need to implement the action here, usually by calling a method to handle the user authentication logic
      @user = User.from_omniauth(request.env['omniauth.auth'])

      if @user.persisted?
        sign_in_and_redirect @user, event: :authentication
        set_flash_message(:notice, :success, kind: 'Facebook') if is_navigational_format?
      else
        session['devise.facebook_data'] = request.env['omniauth.auth'].except(:extra)
        redirect_to root_path
      end
    end

    def failure
      redirect_to root_path, alert: 'Failed to connect your Facebook account.'
    end
  end
end
