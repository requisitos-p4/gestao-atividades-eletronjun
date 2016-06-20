class StaticPagesController < ApplicationController
  def home
    @user = current_user
    @boards = Board.all
  end
end
