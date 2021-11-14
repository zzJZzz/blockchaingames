class GamesController < ApplicationController
  def index
    @games = Game.page(params[:page]).per(25)
  end

  def new
    @games = Game.new
  end

  def create
  @games = Game.new(params.require(:game).permit(:title, :description, :url))
  if @games.save
    redirect_to root_path
  else
    render "new"
  end
end
end
