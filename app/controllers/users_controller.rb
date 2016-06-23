class UsersController < ApplicationController

  before_action :authenticate_user

  def show
    @boards = Board.all
    @user = User.find(params[:id])
  end

  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      log_in @user
      flash.now[:success] = "Bem Vindo!"
      redirect_to @user
    else
      render 'new'
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])

    if @user.update_attributes(user_params)
      flash[:success] = "Quadro atualizado com sucesso!"
      redirect_to @user
    else
      render 'edit'
    end
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy

    redirect_to users_path
  end

  private
    def user_params
      params.require(:user).permit(:name, :email, :password, :password_confirmation, :role, :member_boards)
    end

end
