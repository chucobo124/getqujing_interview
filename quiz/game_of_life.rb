# According to the Wikipedia's article: "The Game of Life, also known simply as
# Life, is a cellular automaton devised by the British mathematician John Horton
# Conway in 1970."
#
# Given a board with m by n cells, each cell has an initial state live (1) or
# dead (0). Each cell interacts with its eight neighbors (horizontal, vertical,
# diagonal) using the following four rules (taken from the above Wikipedia article):
#
# 1. Any live cell with fewer than two live neighbors dies, as if caused by under-population.
# 2. Any live cell with two or three live neighbors lives on to the next generation.
# 3. Any live cell with more than three live neighbors dies, as if by over-population.
# 4. Any dead cell with exactly three live neighbors becomes a live cell, as if by
# reproduction. Write a function to compute the next state (after one update) of
# the board given its current state.
# Follow up:
#
# Could you solve it in-place? Remember that the board needs to be updated at the
# same time: You cannot update some cells first and then use their updated values
# to update other cells.
# In this question, we represent the board using a 2D array. In principle, the
# board is infinite, which would cause problems when the active area encroaches
# the border of the array. How would you address these problems?
class GameOfLife
  # initialize board
  #
  # @param [Array] board The board of initialize cell
  # @return [nil]
  def initialize(board)
    @board = board
  end

  # Check the position to decide the cell execute is needed
  # Role:
  #  - Any live cell with more than three live neighbors dies, as if by over-population.
  #  - Any live cell with fewer than two live neighbors dies, as if caused by under-population.
  #
  # @param [Array] position cell position , array x,y coordinate
  # @return [nil]
  def kill_cell(position)
  end

  # Check the position to decide the cell is alived
  # Role:
  #  - Any live cell with two or three live neighbors lives on to the next generation.
  #
  # @param [Array] position cell position , array x,y coordinate
  # @return [nil]
  def keep_cell_alive(position)
  end

  # Check the position to decide cell rebron
  # Role:
  #  - Any dead cell with exactly three live neighbors becomes a live cell, as
  # if by reproduction.
  #
  #
  # @param [Type] position cell position , array x,y coordinate
  # @return [Type] description of returned object
  def grow_out_cells(position)
  end

  private

  # Check Cell arround retrun how many true and false
  #
  # @param [Array] position cell position , array x,y coordinate
  # @return [Hash] return detail of cell arround message
  def check_cell(_position)
    result = { true: 0, false: 0 }
    result
  end

  # get around cell
  #
  # @param [Array] position cell position , array x,y coordinate
  # @return [array] A list of around cell message
  def gather_around_cell(position)
    result = []
    uper_layer = @board[position[0] - 1]
    lower_layer = @board[position[0] + 1]
    [uper_layer, lower_layer].each do |layer|
      [layer[position[1] - 1],
       layer[position[1]],
       layer[position[1] + 1]].each do |cell|
        next if cell.nil?
        result << cell
      end
    end
    result
    # uper_layer_middle_cell= uper_layer[position[1]]
    # uper_layer_right_cell= uper_layer[position[1]+1]
    # uper_layer_left_cell= uper_layer[position[1]-1]
    # current_layer_right_cell= @board[position[0]][position[1]+1]
    # current_layer_left_cell= @board[position[0]][position[1]-1]
    # lower_layer = @board[position[0]-1]
    # lower_layer_middle_cell= lower_layer[position[1]]
    # lower_layer_right_cell= lower_layer[position[1]+1]
    # lower_layer_left_cell= lower_layer[position[1]-1]
  end
end
