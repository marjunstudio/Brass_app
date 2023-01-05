class TopPagesController < ApplicationController
  skip_before_action :require_login, only: %i[top]

  def top
    @q = Category.ransack(params[:@q])
    @categories = @q.result
  end
end
