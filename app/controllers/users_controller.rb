class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user
      redirect_to root_path, notice: 'ユーザー登録が完了しました'
    else
      flash.now[:alert] = 'ユーザー登録に失敗しました'
      render new
    end
  end

  private

  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation, :last_name, :first_name)
  end
end
