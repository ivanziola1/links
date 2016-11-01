class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  rescue_from CanCan::AccessDenied, with: :access_denied

  def after_sign_in_path_for(_resource)
    _resource.admin? ? rails_admin_path : :root
  end

  def after_sign_out_path_for(_resource)
    new_user_session_path
  end

  private

  def access_denied(_exception)
    redirect_to signed_in? ? main_app.root_path : main_app.new_user_session_path,
                alert: _exception.message
  end
end
