class PagesController < ApplicationController
  def index
    @pages = Page.where(book_id: params[:book_id])
    @book = Book.find(params[:book_id])
  end

  def new
    @page = Page.new
    @book = Book.find(params[:book_id])
  end

  def create
    page = Page.new(page_params)
    if page.save
    redirect_to book_pages_path
    else
      @page = Page.new
      @book = Book.find(params[:book_id])
      render :new
    end
  end

  def show
    @page = Page.find(params[:id])
    @book = Book.find(params[:book_id])
  end

  def destroy
    page = Page.find(params[:id])
    page.destroy
    redirect_to book_pages_path
  end

  def edit
    @page = Page.find(params[:id])
    @book = Book.find(params[:book_id])
  end

  def update
    page = Page.find(params[:id])
    if page.update(page_params)
      redirect_to book_pages_path
    else
      render :edit
    end
  end

  private
  def page_params
    params.require(:page).permit(:title, :image, :number).merge(book_id: params[:book_id])
  end
end