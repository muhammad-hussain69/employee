# frozen_string_literal: true

class Emps::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  def google_oauth2
    @emp = Emp.from_omniauth(request.env['omniauth.auth'])

    if @emp.persisted?
      sign_in_and_redirect @emp, event: :authentication
      set_flash_message(:notice, :success, kind: 'Google') if is_navigational_format?
    else
      redirect_to new_emp_registration_url, alert: @emp.errors.full_messages.join("\n")
    end
  end
end
