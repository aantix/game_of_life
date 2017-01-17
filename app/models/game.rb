class Game < ApplicationRecord
  has_many :generations, -> { order(iteration: :desc) }, inverse_of: :game, autosave: true


  def current_generation
    generations.first
  end

  def previous_generation(current)
    return nil unless generation_index(1, current)
    generations[generation_index(1, current)]
  end

  def next_generation(current)
    return nil unless generation_index(-1, current)
    generations[generation_index(-1, current)]
  end

  def self.test_game(seed, num_of_iterations, expected_state)
    game = GameOfLifeEngine.new(seed_to_cells(seed))

    puts '-----------------------------------------------------'
    puts "initial seed       = #{seed_to_cells(seed)}"
    puts
    num_of_iterations.times do |gen|
      game.next_generation

      puts "#{(gen + 1).ordinalize} gen game.cells = #{game.cells.inspect}"
      puts
    end
    puts "expected end state = #{seed_to_cells(expected_state)}"
    puts '-----------------------------------------------------'

    game.cells == seed_to_cells(expected_state)
  end

  def to_param
    "#{id}-#{name.parameterize}"
  end

  private

  def self.seed_to_cells(seeding)
    cells = []
    seeding.first.size.times {cells << Array.new}

    seeding.each_with_index do |seed, y|
      seed.each_with_index do |value, x|
        cells[y][x] = Cell.new(!value.zero?)
      end
    end

    cells
  end

  def generation_index(offset, current)
    # binding.pry
    index = generations.to_a.index(current)
    return nil unless index

    final_index = index + offset
    return nil if final_index < 0

    final_index
  end

end
