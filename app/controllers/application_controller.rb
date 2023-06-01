class ApplicationController < ActionController::Base
  protect_from_forgery

  def require_superadmin!
    unless current_user && current_user.superadmin?
      flash[:alert] = t("admin.unauthorized")
      redirect_to root_path
    end
  end
end
