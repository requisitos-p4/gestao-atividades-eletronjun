class StaticPagesController < ApplicationController

  before_action :authenticate_user

  def home
    @user = current_user
    @admin_boards = Board.select { |b| b.admin.include?(@user.id) }
    @boards = Board.all
  end
end
