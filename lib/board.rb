class Board
  attr_reader :grid
  def initialize
    @grid = Array.new(6) { Array.new(7, '-') }
  end

  def display
    # @grid[0][0] = "Y"
    # @grid[1][0] = "P"


    grid.each do |row|
      row.each do |col|
        print "#{col} "
      end
      puts
    end
    puts "1 2 3 4 5 6 7"
  end

  def col_full?(col)
    grid[0][col].is_a?(Symbol)
  end

  def update(col, symbol)
    row = 5
    while grid[row][col].is_a?(Symbol)
      row -= 1
    end
    @grid[row][col] = symbol
  end

  def check_win(row, col, symbol)
    horiz_win(row, col, symbol) || vert_win(row, col, symbol) || left_diag_win(row, col, symbol) || right_diag_win(row, col, symbol)
  end

  def horiz_win(row, col, symbol)
    return if col > 3
    grid[row][col] == symbol and grid[row][col + 1] == symbol and grid[row][col + 2] == symbol and grid[row][col  + 3] == symbol 
  end

  def vert_win(row, col, symbol)
    return if row > 2
    grid[row][col] == symbol and grid[row + 1][col] == symbol and grid[row + 2][col] == symbol and grid[row + 3][col] == symbol 
  end

  def left_diag_win(row, col, symbol)
    return if col > 3
    return unless row < 3
    grid[row][col] == symbol and grid[row + 1][col + 1] == symbol and grid[row + 2][col + 2] == symbol and grid[row + 3][col + 3] == symbol 
  end

  def right_diag_win(row, col, symbol)
    return if col < 3
    return unless row < 3
    grid[row][col] == symbol and grid[row + 1][col - 1] == symbol and grid[row + 2][col - 2] == symbol and grid[row + 3][col - 3] == symbol 
  end

  def draw?
    grid.flatten.none? {|item| item.is_a?(String)}
  end

end