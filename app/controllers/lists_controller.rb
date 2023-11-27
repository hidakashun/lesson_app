class ListsController < ApplicationController
  def new
    # Viewへ渡すためのインスタンス変数に空のModelオブジェクトを生成する。
    @list = List.new
  end

  def create
    @list = List.new(list_params)
    if @list.save # 保存されたとき
      redirect_to list_path(@list.id)
    else # 保存されなかった時
      render :new
    end
  end

  def index
    @lists = List.all
  end

  def show
    @list = List.find(params[:id])
  end

  def edit
    #findメソッドを使い、保存されているデータを取得
    @list = List.find(params[:id])
  end

  def update
    @list = List.find(params[:id])
    if @list.update(list_params) # 更新されたとき
      redirect_to list_path(@list.id)
    else# 更新されなかったとき
      render :edit
    end
  end

  def destroy
    list = List.find(params[:id])  # データ（レコード）を1件取得
    list.destroy  # データ（レコード）を削除
    redirect_to lists_path  # 投稿一覧画面へリダイレクト
  end

  private
  # ストロングパラメータ
  def list_params# 保存機能を追加
    params.require(:list).permit(:title, :body, list_images: [])
  end
end