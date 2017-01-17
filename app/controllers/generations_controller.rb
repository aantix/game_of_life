class GenerationsController < ApplicationController
  before_action :set_generation, only: :show

  def new
    @generation = Generation.new
  end

  def create
    @generation = Generation.new(generation_params).next_generation

    if @generation.save
      redirect_to game_generation_path(@generation.game, @generation), notice: 'Generation was successfully created.'
    else
      render :new
    end
  end

  def show
  end

  private

  def set_generation
    @generation = Generation.find(params[:id])
  end

  def generation_params
    params.permit(:game_id, :generation)
  end

end
