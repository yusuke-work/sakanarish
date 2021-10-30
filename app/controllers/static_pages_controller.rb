class StaticPagesController < ApplicationController
  skip_before_action :require_login, only: %i[top]

  def top
    # binding.pry
  end

  def privacy

  end

  def terms
    
  end
end
