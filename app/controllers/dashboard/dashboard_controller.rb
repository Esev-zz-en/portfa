class Dashboard::DashboardController < ApplicationController
  before_action :authenticate_user!
  layout 'dashboard'

  protected

  def site
    @site ||= current_user.site
  end
end
