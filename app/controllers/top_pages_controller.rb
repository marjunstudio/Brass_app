class TopPagesController < ApplicationController
  skip_before_action :require_login, only: [:top, :index]
  def top;end

  def index;end
end
