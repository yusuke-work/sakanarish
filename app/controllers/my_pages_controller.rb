class MyPagesController < ApplicationController
  before_action :check_general, only: %i[show]
  
  def show
    @user = User.find(current_user.id)
  end
end
