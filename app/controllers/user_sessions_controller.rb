class UserSessionsController < ApplicationController
  skip_before_action :require_login, only: %i[new create guest_login]

  def new; end

  def create
    @user = login(params[:email], params[:password])
    if @user
      # redirect_back_or_to root_path, notice: 'ログインしました'
      redirect_to root_path, notice: 'ログインしました'
    else
      flash.now[:alert] = 'ログインに失敗しました'
      render :new
    end
  end

  def destroy
    logout
    redirect_to root_path, notice: 'ログアウトしました'
  end

  def guest_login
    # ゲストユーザーで新規作成
    user = User.guest
    auto_login(user)
    redirect_to new_question_evaluation_path, notice: 'ゲストユーザーとしてログインしました。'
  end

  def guest_destroy
    # ゲストユーザー削除
  end
end
