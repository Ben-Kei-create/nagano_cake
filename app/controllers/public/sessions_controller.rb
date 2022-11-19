# frozen_string_literal: true

class Public::SessionsController < Devise::SessionsController
before_action :customer_state, only: [:create]
  # GET /resource/sign_in
  # def new
  #   super
  # end

  # POST /resource/sign_in
  # def create
  #   super
  # end

  # DELETE /resource/sign_out
  # def destroy
  #   super
  # end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
  # end
protected
# 退会しているかを判断するメソッド
def customer_state
  ## 【処理内容1】 入力されたemailからアカウントを1件取得
  @customer = Customer.find_by(email: params[:customer][:email])
  ## アカウントを取得できなかった場合、このメソッドを終了する
  return if !@customer
  ## 【処理内容2】 取得したアカウントのパスワードと入力されたパスワードが一致してるかを判別
  if @customer.valid_password?(params[:customer][:password])
    ## 【処理内容3】
  end

  # 【処理内容3】 「1」と「2」の処理が真(true)だった場合、そのアカウントのis_deletedカラムに格納されている値を確認し
  #     trueだった場合、退会しているのでサインアップ画面に遷移する
  #     falseだった場合、退会していないのでそのままcreateアクションを実行させる処理を実行する
# is_deletedの値がtrueだった場合
#   trueだった場合サインアップ画面に遷移する処理を実行する
# is_deletedの値がfalseだった場合
#   createアクションを実行させる


end
