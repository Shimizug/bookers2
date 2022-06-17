class BooksController < ApplicationController
  def index
    # 投稿フォームのためのからのインスタンス
    @book = Book.new
    # 一覧表示のためにbooksテーブル内のすべてのレコードのインスタンスを取得
    @books = Book.all
    @user = User.find(params[:id])
  end
  # 本の新規投稿のためのアクション
  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    @book.save
    redirect_to books_path
  end
  
  def update
    book = Book.find(params[:id])
    book.update(book_params)
    redirect_to books_path
  end

  def edit
    @book = Book.find(params[:id])
  end
# 特定のIDのbookモデルを格納
  def show
    @book = Book.find(params[:id])
    @user = User.find(params[:id])
    @bookn = Book.new
  end
  
  def destroy
    @book = Book.find(params[:id])
    @book.destroy
    redirect_to books_path
  end
  
  
  private
  
  def book_params
    params.require(:book).permit(:title, :body, :profile_image)
  end
end

