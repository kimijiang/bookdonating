require 'test_helper'

class AddAuthorToBooksControllerTest < ActionController::TestCase
  setup do
    @add_author_to_book = add_author_to_books(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:add_author_to_books)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create add_author_to_book" do
    assert_difference('AddAuthorToBook.count') do
      post :create, add_author_to_book: {  }
    end

    assert_redirected_to add_author_to_book_path(assigns(:add_author_to_book))
  end

  test "should show add_author_to_book" do
    get :show, id: @add_author_to_book
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @add_author_to_book
    assert_response :success
  end

  test "should update add_author_to_book" do
    patch :update, id: @add_author_to_book, add_author_to_book: {  }
    assert_redirected_to add_author_to_book_path(assigns(:add_author_to_book))
  end

  test "should destroy add_author_to_book" do
    assert_difference('AddAuthorToBook.count', -1) do
      delete :destroy, id: @add_author_to_book
    end

    assert_redirected_to add_author_to_books_path
  end
end
