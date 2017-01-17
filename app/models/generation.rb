require_dependency 'cell'

class Generation < ApplicationRecord
  serialize :cells, Array

  belongs_to :game

  DEFAULT_WIDTH  = 9
  DEFAULT_HEIGHT = 9

  def first_generation
    self.cells = GameOfLifeEngine.first_generation(DEFAULT_WIDTH, DEFAULT_HEIGHT)
  end

  def next
    game.next_generation(self)
  end

  def previous
    game.previous_generation(self)
  end

  def next_generation
    new_generation = game.generations.build
    new_generation.iteration = game.current_generation.iteration + 1

    new_generation.cells = GameOfLifeEngine.new(game.current_generation.cells).next_generation
    new_generation
  end

  def to_param
    "#{id}-#{iteration.ordinalize}-generation"
  end


end
