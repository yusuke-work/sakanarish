class MyPagesController < ApplicationController
  before_action :not_general_or_admin
  
  def show
    @user = User.find(current_user.id)
  end
end
