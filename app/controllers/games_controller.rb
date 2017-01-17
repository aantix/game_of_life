class GamesController < ApplicationController
  def new
    @game = Game.new
  end

  def create
    @game = Game.new(game_params)
    @game.generations.build.first_generation

    if @game.save
      redirect_to game_generation_path(@game, @game.current_generation), notice: 'Game was successfully created.'
    else
      render :new
    end
  end

  private

  def game_params
    params.require(:game).permit(:name)
  end

end
