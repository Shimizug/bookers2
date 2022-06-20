class BooksController < ApplicationController


  def index
    # 投稿フォームのためのからのインスタンス
    @book = Book.new
    # 一覧表示のためにbooksテーブル内のすべてのレコードのインスタンスを取得
    @books = Book.all
  end

  # 本の新規投稿のためのアクション
  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    if @book.save
      redirect_to book_path(@book.id),notice: 'You have created book successfully.'
    else
      @books = Book.all
      render :index
    end
  end

  def update
    @book = Book.find(params[:id])
    if @book.update(book_params)
      redirect_to book_path(@book.id), notice: 'You have updated book successfully.'
    else
      render :edit
    end
  end

  def edit
    @book = Book.find(params[:id])
    if @book.user ==current_user
      render :edit
    else
      redirect_to books_path
    end
  end

  def show
    @book = Book.find(params[:id])
    @user = @book.user
    @new_book = Book.new
  end

  def destroy
    @book = Book.find(params[:id])
    @book.destroy
    redirect_to books_path
  end


  private

  def book_params
    params.require(:book).permit(:title, :body)
  end


end

