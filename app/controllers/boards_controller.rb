class BoardsController < ApplicationController

  before_action :authenticate_user

  def new
    @board = Board.new
    @users = User.all - [current_user]
    @tags = Tag.all
  end

  def create
    @board = Board.new(board_params)
   
    members = params[:board][:members].reject{ |u| u == "0" } unless params[:board][:members].nil?
    @board.members = members unless members.nil?
    @board.admin.push(current_user.id)

    tags = params[:board][:tags].reject{ |u| u == "0" } unless params[:board][:tags].nil?
    @board.tags = tags unless tags.nil?

    if @board.save
      flash[:success] = "Quadro criado com sucesso!"
      redirect_to @board
    else
      render 'new'
    end
  end

  def show
    @board = Board.find(params[:id])
  end

  def index
    @boards = Board.all
  end

  def edit
    @board = Board.find(params[:id])
  end

  def update
    @board = Board.find(params[:id])

    if @board.update_attributes(board_params)
      flash[:success] = "Quadro atualizado com sucesso!"
      redirect_to @board
    else
      render 'edit'
    end
  end

  def destroy
    @board = Board.find(params[:id])
    @board.destroy
    
    redirect_to boards_path          
  end

  def assign_members
    @board = Board.find(params[:id])
    members = @board.members

    ids = []
    User.all.each do |id|
      ids.push(id)
    end

    @users = ids - [members] - [current_user.id]
  end

  def member_assignment
    @board = Board.find(params[:id])

    members = params[:board][:members].reject{ |u| u == "0" } unless params[:board][:members].nil?
    @board.members =members unless members.nil?

    @board.save

    redirect_to @board
  end

  def unassign
    @board = Board.find(params[:id])
    @board.members.delete(params[:member_id])
    @board.save
    redirect_to @board
  end

  private

    def board_params
      params.require(:board).permit(:description, :name, :admin)
    end
end
