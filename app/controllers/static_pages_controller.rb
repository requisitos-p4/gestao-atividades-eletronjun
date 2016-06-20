class StaticPagesController < ApplicationController

  before_action :authenticate_user

  def home
    @user = current_user
    @boards = Board.all
  end
end
