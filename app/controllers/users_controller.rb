class UsersController < ApplicationController
  before_action :set_user, only: [:edit, :update, :show]
  before_action :authenticate_user!
  before_action :ensure_correct_user, only: [:edit, :update]
  def index
    @users = User.all
  end
  def edit
  end
  def update
    if @user.update(user_params)
      redirect_to user_path(@user.id), notice: "ユーザーを編集しました"
    else
      render :edit
    end
  end
  def show
    @cinemas = @user.cinemas.order(updated_at: "DESC")
    @followings = @user.following
  end
  private
  def user_params
    params.require(:user).permit(:name, :email)
  end
  def set_user
    @user = User.find(params[:id])
  end
  def ensure_correct_user
    if @user.id != current_user.id
      redirect_to cinemas_path, notice: "他人のプロフィールを編集することはできません"
    end
  end
end
