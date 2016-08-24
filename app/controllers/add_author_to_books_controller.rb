class AddAuthorToBooksController < ApplicationController
  before_action :set_add_author_to_book, only: [:show, :edit, :update, :destroy]

  # GET /add_author_to_books
  # GET /add_author_to_books.json
  def index
    @add_author_to_books = AddAuthorToBook.all
  end

  # GET /add_author_to_books/1
  # GET /add_author_to_books/1.json
  def show
  end

  # GET /add_author_to_books/new
  def new
    @add_author_to_book = AddAuthorToBook.new
  end

  # GET /add_author_to_books/1/edit
  def edit
  end

  # POST /add_author_to_books
  # POST /add_author_to_books.json
  def create
    @add_author_to_book = AddAuthorToBook.new(add_author_to_book_params)

    respond_to do |format|
      if @add_author_to_book.save
        format.html { redirect_to @add_author_to_book, notice: 'Add author to book was successfully created.' }
        format.json { render :show, status: :created, location: @add_author_to_book }
      else
        format.html { render :new }
        format.json { render json: @add_author_to_book.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /add_author_to_books/1
  # PATCH/PUT /add_author_to_books/1.json
  def update
    respond_to do |format|
      if @add_author_to_book.update(add_author_to_book_params)
        format.html { redirect_to @add_author_to_book, notice: 'Add author to book was successfully updated.' }
        format.json { render :show, status: :ok, location: @add_author_to_book }
      else
        format.html { render :edit }
        format.json { render json: @add_author_to_book.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /add_author_to_books/1
  # DELETE /add_author_to_books/1.json
  def destroy
    @add_author_to_book.destroy
    respond_to do |format|
      format.html { redirect_to add_author_to_books_url, notice: 'Add author to book was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_add_author_to_book
      @add_author_to_book = AddAuthorToBook.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def add_author_to_book_params
      params.fetch(:add_author_to_book, {})
    end
end
