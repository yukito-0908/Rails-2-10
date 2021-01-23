class TodolistsController < ApplicationController

  def index
    @lists = List.all
end

def show
  @list = List.find(params[:id])
end
def edit
  @list = List.find(params[:id])
end

def  update
  list = List.find(params[:id])
  list.update(list_params)
  redirect_to todolist_path(list.id)
end
def destroy
  list = List.find(params[:id]) #データ（レコード）を1件所得
  list.destroy # データ（レコード）を排除
  redirect_to todolists_path # 投稿一覧画面へリレダイレクト
end

def destroy
end
  def new
    # Viewへ渡すためのインスタント変数にからのモデルオブジェクトを生成する。
    @list = List.new
  end
  # 以下を追加
  def create
    # 1.データを新規登録するためのインスタント生成
    list = List.new(list_params)
    # 2.データをデータベースに保存するためのsaveメソッド実行
    list.save
    # 3.詳細画面へリダイレクト
    redirect_to todolist_path(list.id)
end

private
# ストロングパラメータ
def list_params
  params.require(:list).permit(:title, :body, :image)
end

end
