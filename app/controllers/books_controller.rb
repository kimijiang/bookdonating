class BooksController < ApplicationController
  load_and_authorize_resource
  skip_authorize_resource only: :donate
  before_action :authenticate_user!, except: :index

  # GET /books
  # GET /books.json
  def index

    if params[:donor].to_i  == current_user.id
      @books = @books.select{ |b| b.user == current_user}
    elsif params[:donee].to_i == current_user.id
      @books = @books.select{ |b| b.donee == current_user}
    else
      @books = Book.all.reject{ |b| b.donated_to? current_user}
    end

    # @books = @books.select { |b| 
    #   b.donee_id==user.id
    # }
  end

  # GET /books/1
  # GET /books/1.json
  def show

  end

  # GET /books/new
  def new
    @book = current_user.books.build
  end

  # GET /books/1/edit
  def edit
  end

  # POST /books
  # POST /books.json
  def create
    @book = current_user.books.build(book_params)

    respond_to do |format|
      if @book.save
        format.html { redirect_to @book, notice: 'Book was successfully created.' }
        format.json { render :show, status: :created, location: @book }
      else
        format.html { render :new }
        format.json { render json: @book.errors, status: :unprocessable_entity }
      end
    end
  end

  def donate
    @book.donee = current_user
    @book.donated_at = Time.now

    if @book.save && ( @book.donated_to? current_user )
      redirect_to action: "index"
      flash[:notice] = "book successfully donated to you!"
    else
      redirect_to @book
      flash[:error] = "Oh no! You can't receive this book"
    end
  end

  # PATCH/PUT /books/1
  # PATCH/PUT /books/1.json
  def update
    respond_to do |format|
      if @book.update(book_params)
        format.html { redirect_to @book, notice: 'Book was successfully updated.' }
        format.json { render :show, status: :ok, location: @book }
      else
        format.html { render :edit }
        format.json { render json: @book.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /books/1
  # DELETE /books/1.json
  def destroy
    @book.destroy
    respond_to do |format|
      format.html { redirect_to books_url, notice: 'Book was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.

    # Never trust parameters from the scary internet, only allow the white list through.
    def book_params
      params.require(:book).permit(:name, :isbn, :image, :age, :description, :subject)
    end
end
