class GamesController < ApplicationController
  before_action :game_search, except: [:index, :new, :create]
  before_action :authenticate_user!, except: [:index, :show]

  def index
    @games = Game.all
  end

  def show
  end

  def new
    @game = Game.new
  end

  def create
    @game = Game.new(game_params)
    if @game.save
      redirect_to games_path
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @game.update(game_params)
      redirect_to game_path(@game)
    else
      render :edit
    end
  end

  def favorite
    @game = Game.find(params[:id])
    current_user.games << @game
    redirect_to games_path
  end

  def unfavorite
    @game = Game.find(params[:id])
    current_user.games.delete(@game)
    redirect_to games_path
  end


  def destroy
    @game.destroy
    redirect_to games_path
  end

  private
  
  def game_search
    @game = Game.find(params[:id])
  end

  def game_params
    params.require(:game).permit(:name, :year, :genre, :publisher, :description)
  end
end
