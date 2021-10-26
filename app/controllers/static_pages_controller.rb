class StaticPagesController < ApplicationController
  skip_before_action :require_login, only: %i[top]

  def top
    # session[:ref] = nil
  end
end
