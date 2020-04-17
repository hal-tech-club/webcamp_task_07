class BooksController < ApplicationController
  # books controller下は認証ガード保護有
  before_action :authenticate_user!

  # newに当たる部分テンプレートはほぼ常時表示

  # Book登録
  def create
  end

  # Book一覧画面表示
  def index
  end

  # Book詳細画面表示
  def show
  end

  # Book編集画面表示
  def edit
  end

  # Book更新
  def update
  end

  # Book削除
  def destroy
  end
end
