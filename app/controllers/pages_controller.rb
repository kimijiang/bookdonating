class PagesController < ApplicationController
  def profile
    @user = current_user
    @received = Book.where(donee: current_user)
    @donated = Book.where(user: current_user)
  end
end
