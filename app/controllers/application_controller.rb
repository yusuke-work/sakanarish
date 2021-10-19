class ApplicationController < ActionController::Base
  # ログインを催促する
  before_action :require_login

  # ログインしていなかったらrequire_loginを通して間接的に呼び出す
  def not_authenticated
    redirect_to login_path, alert: 'ログインしてください'
  end
end
