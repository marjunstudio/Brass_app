class Admin::BaseController < ApplicationController
  add_flash_types :success, :info, :warning, :danger
  before_action :require_login

  private

  def not_authenticated
    redirect_to main_app.root_path, warning: t('defaults.not_authority')
  end
end