class UsersController < ApplicationController
  skip_before_action :require_login, only: %i[new create]

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    # binding.pry
    if @user.save
      redirect_to root_path, notice: 'ユーザー登録が完了しました'
    else
      flash.now[:alert] = 'ユーザー登録に失敗しました'
      # リロードしてrenderするとhttpメソッドgetで/usersにアクセスしてしまい､ルーティングエラーになる｡
      # 原因はturbolinksかもしれない｡一応無効化にしておいた｡
      render :new
    end
  end

  private

  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation, :last_name, :first_name)
  end
end
