class ListsController < ApplicationController
  def new
    # Viewへ渡すためのインスタンス変数に空のModelオブジェクトを生成する。
    @list = List.new
  end

  def create# 保存機能を追加
    # １.&2. データを受け取り新規登録するためのインスタンス作成
    list = List.new(list_params)
    # 3. データをデータベースに保存するためのsaveメソッド実行
    list.save
    # 4. 一時的にトップ画面へリダイレクト
    redirect_to root_path
  end

  def index
  end

  def show
  end

  def edit
  end

  private
  # ストロングパラメータ
  def list_params# 保存機能を追加
    params.require(:list).permit(:title, :body)
  end
end