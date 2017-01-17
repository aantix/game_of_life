module GenerationsHelper
  def alive_dead_class(cell)
    cell.alive? ? 'alive' : 'dead'
  end

  def alive_dead_icon(cell)
    cell.alive? ? 'female' : 'window-close'
  end
end
