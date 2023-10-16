class ListsController < ApplicationController
  def new
    # viewへ渡すためのインスタンス変数に空のModelオブジェクトを生成する。
    @list = List.new
  end
  
  def create
    # 1.データを受け取り新規登録するためのインスタンス作成
    @list = List.new(list_params)
    # 2.データをデータベースに保存するためのsaveメッソド実行
    if @list.save
      flash[:notice] = "投稿に成功しました。"
      redirect_to list_path(@list.id) #引数の(list.id)をつけないとエラー
    else
      # 3.フラッシュメッセージを定義し、new.html.erbを描写する
      flash.now[:alert] = "投稿に失敗しました。" #キーをalertに変更
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
    @list = List.find(params[:id])
  end
  
  def update
    list = List.find(params[:id])
    list.update(list_params)
    redirect_to list_path(list.id)
  end
  
  def destroy
    list = List.find(params[:id]) #データ（レコード）を１件取得
    list.destroy #データ（レコード）を削除
    redirect_to '/lists' #投稿一覧画面へリダイレクト
  end
  
  private
  # ストロングパラメータ
  def list_params
    params.require(:list).permit(:title, :body, :image)
  end
  
end
