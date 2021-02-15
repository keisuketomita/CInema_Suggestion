class CinemasController < ApplicationController
  before_action :set_cinema, only: [:edit, :update, :destroy, :show]
  before_action :authenticate_user!
  before_action :ensure_correct_user, only: [:edit, :update, :destroy]

  def index
    @cinemas = Cinema.all
  end
  def new
    @cinema = Cinema.new
  end
  def create
    @cinema = Cinema.new(cinema_params)
    @cinema.user_id = current_user.id
    if @cinema.save
      redirect_to cinemas_path, notice:"映画を登録しました"
    else
      render :new
    end
  end
  def edit
  end
  def update
    if @cinema.update(cinema_params)
      redirect_to cinemas_path, notice: "映画を編集しました"
    else
      render :edit
    end
  end
  def destroy
    @cinema.destroy
    redirect_to cinemas_path, notice: "映画を削除しました"
  end
  def show
  end

  private
  def cinema_params
    params.require(:cinema).permit(:title, :url)
  end
  def set_cinema
    @cinema = Cinema.find(params[:id])
  end
  def ensure_correct_user
    if @cinema.user_id != current_user.id
      redirect_to cinemas_path, notice: "他人の投稿を編集・削除することはできません"
    end
  end
end
