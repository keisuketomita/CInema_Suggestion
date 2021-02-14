class CinemasController < ApplicationController
  before_action :set_cinema, only: [:edit, :update, :destroy, :show]
  def index
    @cinemas = Cinema.all
  end
  def new
    @cinema = Cinema.new
  end
  def create
    @cinema = Cinema.new(cinema_params)
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
end
