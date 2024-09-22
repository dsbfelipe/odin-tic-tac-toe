class Board
  def initialize
    @board = [
      [' ', ' ', ' '],
      [' ', ' ', ' '],
      [' ', ' ', ' ']
    ]
    @winner = false
    @draw = false
  end

  attr_reader :board, :winner, :draw

  def check_for_winner
    win_conditions = {
      one: @board[0][0] == @board[0][1] && @board[0][0] == @board[0][2] && @board[0][0] != ' ',
      two: @board[1][0] == @board[1][1] && @board[1][0] == @board[1][2] && @board[1][0] != ' ',
      three: @board[2][0] == @board[2][1] && @board[2][0] == @board[2][2] && @board[2][0] != ' ',
      four: @board[0][0] == @board[1][0] && @board[0][0] == @board[2][0] && @board[0][0] != ' ',
      five: @board[0][1] == @board[1][1] && @board[0][1] == @board[2][1] && @board[0][1] != ' ',
      six: @board[0][2] == @board[1][2] && @board[0][2] == @board[2][2] && @board[0][2] != ' ',
      seven: @board[0][0] == @board[1][1] && @board[0][0] == @board[2][2] && @board[0][0] != ' ',
      eight: @board[0][2] == @board[1][1] && @board[0][2] == @board[2][0] && @board[0][2] != ' '
    }

    win_conditions.each_value do |condition|
      if condition
        @winner = true
        break
      end
    end

    @winner
  end

  def check_for_draw
    return unless @board.flatten.none? { |cell| cell == ' ' } && @winner == false

    @draw = true
  end
end
