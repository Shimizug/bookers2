class HomesController < ApplicationController
  def top
  end

  def books
    @book = Book.new
    @books = Book.all
    @user = User.find(params[:id])
  end
end
