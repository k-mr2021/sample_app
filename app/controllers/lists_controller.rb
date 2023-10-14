class ListsController < ApplicationController
  def new
    # viewへ渡すためのインスタンス変数に空のModelオブジェクトを生成する。
    @list = List.new
  end
  
  def create
    # 1.&2.データを受け取り新規登録するためのインスタンス作成
    list = List.new(list_params)
    # 3.データをデータベースに保存するためのsaveメッソド実行
    list.save
    # redirect_to '/top'を削除して、以下コードに変更
    # 詳細画面へリダイレクト
    redirect_to list_path(list.id) #引数の(list.id)をつけないとエラー
  end

  def index
    @lists = List.all
  end

  def show
    @list = List.find(params[:id])
  end

  def edit
    @list = List.find(params[:id])
  end
  
  private
  # ストロングパラメータ
  def list_params
    params.require(:list).permit(:title, :body)
  end
  
end
