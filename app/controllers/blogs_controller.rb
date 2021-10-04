class BlogsController < ApplicationController
  def index
    @blog = Blog.new
    #blogモデルのテーブルから全てデータを取り出し＠blogsに代入（配列でデータが入っている）
    @blogs = Blog.all  
  end

  def create
    blog = Blog.new(blog_params)  # １. データを新規登録するためのインスタンス作成
    blog.save                     # ２. データをデータベースに保存するためのsaveメソッド実行
    redirect_to blogs_path
  end

  def show
  end

  def edit
  end

  private # ストロングパラメータ

  def blog_params
    params.require(:blog).permit(:title, :category, :body)
  end

end
