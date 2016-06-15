class BoardsController < ApplicationController
  def new
    @board = Board.new
  end

  def create
    @board = Board.new(board_params)
   
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

  private

    def board_params
      params.require(:board).permit(:description, :name)
    end
end
