class TopPagesController < ApplicationController
  skip_before_action :require_login, only: %i[top]
  before_action :set_category
  before_action :set_composer
  before_action :set_music

  def top;end
end
