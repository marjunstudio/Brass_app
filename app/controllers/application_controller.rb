class ApplicationController < ActionController::Base
  add_flash_types :success, :info, :warning, :danger
  before_action :require_login

  private

  def not_authenticated
    # Make sure that we reference the route from the main app.
    redirect_to main_app.login_path, warning: t('defaults.warning')
  end

  # def not_authenticated
  #   redirect_to login_path, warning: t('defaults.warning')
  # end

  def set_category
    @category = Category.ransack(params[:q])
    @categories = @category.result
  end

  def set_composer
    @composer = Composer.ransack(params[:q])
    @composers = @composer.result
  end

  def set_music
    @music = Music.ransack(params[:q])
    @musics = @music.result.includes(:composer)
  end
end
