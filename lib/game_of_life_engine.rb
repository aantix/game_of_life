class GameOfLifeEngine
  OVERPOPULATED_THRESHOLD  = 3
  UNDERPOPULATED_THRESHOLD = 2
  REPRODUCTIVE_MEASURE     = 3

  NEIGHBORS                = [
      [[-1, -1], [0, -1], [1, -1]],
      [[-1,  0],          [1,  0]],
      [[-1,  1], [0,  1], [1,  1]]
  ]

  ##
  # Two dimensional array; individual cells are booleans
  #  true  == alive
  #  false == dead
  attr_reader :cells

  def initialize(cells)
    @cells = cells
  end

  ##
  # Class method that randomly generates the first
  # iteration of a width X height generation
  def self.first_generation(width, height)
    cells = []

    width.times {cells << Array.new}

    width.times do |y|
      height.times do |x|
        cells[x][y] = Cell.new((rand(5) == 1))
      end
    end

    cells
  end

  def next_generation
    cells.each_with_index do |cell, y|
      cell.each_with_index do |individual_cell, x|
        # Any live cell with fewer than two live neighbours dies,
        #  as if caused by under­population.
        if underpopulated?(individual_cell, x, y)
          individual_cell.dead!
          next
        end

        # Any live cell with two or three live neighbours lives on
        #  to the next generation.
        next if abundance?(individual_cell, x, y)

        # Any live cell with more than three live neighbours dies,
        #  as if by over­population.
        if overpopulation?(individual_cell, x, y)
          individual_cell.dead!
          next
        end

        # Any dead cell with exactly three live neighbours becomes a live cell,
        #  as if by reproduction.
        individual_cell.alive! if reproduction?(individual_cell, x, y)
      end
    end
  end

  private

  def reproduction?(individual, x, y)
    individual.dead? && number_of_neighbors(x, y) == REPRODUCTIVE_MEASURE
  end

  def abundance?(individual, x, y)
    individual.alive? && (2..3).include?(number_of_neighbors(x, y))
  end

  def underpopulated?(individual, x, y)
    individual.alive? && number_of_neighbors(x, y) < UNDERPOPULATED_THRESHOLD
  end

  def overpopulation?(individual, x, y)
    individual.alive? && number_of_neighbors(x, y) > OVERPOPULATED_THRESHOLD
  end

  def number_of_neighbors(x, y)
    neighbor_count = 0

    NEIGHBORS.each_with_index do |neighbor_row, row|
      neighbor_row.each_with_index do |neighbor_cell_offsets, col|
        neighbor_xoffset, neighbor_yoffset = neighbor_cell_offsets

        xoffset = offset(neighbor_xoffset, x)
        next if outside_bounds?(xoffset)

        yoffset = offset(neighbor_yoffset, y)
        next if outside_bounds?(yoffset)

        cell = cells.dig(yoffset, xoffset)
        neighbor_count+=1 if cell.try(:alive?)
      end
    end

    neighbor_count
  end

  def offset(neighbor_offset, item)
    item + neighbor_offset
  end

  def outside_bounds?(offset)
    offset < 0
  end
end