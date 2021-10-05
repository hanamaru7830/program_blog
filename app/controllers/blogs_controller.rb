class BlogsController < ApplicationController
  def index
    @blog = Blog.new
    #blogモデルのテーブルから全てデータを取り出し＠blogsに代入（配列でデータが入っている）
    @blogs = Blog.page(params[:page]).reverse_order
  end

  def create
    blog = Blog.new(blog_params)  # １. データを新規登録するためのインスタンス作成
    blog.save                     # ２. データをデータベースに保存するためのsaveメソッド実行
    redirect_to blogs_path
  end

  def show
    @blog = Blog.find(params[:id])
  end

  def edit
    @blog = Blog.find(params[:id])
  end
  
  def update
    blog = Blog.find(params[:id])
    blog.update(blog_params)
    redirect_to blog_path(blog.id)
  end 
  
  def destroy
    blog = Blog.find(params[:id])
    blog.destroy
    redirect_to blogs_path
  end 
  
  def search
    @blogs = Blog.search(params[:search])
  end
  
  private # ストロングパラメータ

  def blog_params
    params.require(:blog).permit(:title, :category, :body)
  end

end
