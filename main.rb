require_relative 'lib/board'
require_relative 'lib/player'

player_one = Player.new('X')
player_two = Player.new('O')
game_board = Board.new

until game_board.winner == true
  game_board.board.each { |row| puts "#{row}" }

  loop do
    puts 'PLAYER 1: Insert a row coordinate'
    row_coordinate = gets.chomp
    puts 'PLAYER 1: Insert a column coordinate'
    column_coordinate = gets.chomp

    if game_board.board[row_coordinate.to_i][column_coordinate.to_i] == ' '
      player_one.mark(game_board.board[row_coordinate.to_i][column_coordinate.to_i])
      game_board.check_for_winner
      game_board.check_for_draw

      if game_board.draw
        puts 'Draw!'
        break
      elsif game_board.winner
        puts 'PLAYER 1 wins!'
        break
      end
      break
    else
      puts 'That position is not available'
    end
  end
  break if game_board.winner || game_board.draw

  game_board.board.each { |row| puts "#{row}" }

  loop do
    puts 'PLAYER 2: Insert a row coordinate'
    row_coordinate = gets.chomp
    puts 'PLAYER 2: Insert a column coordinate'
    column_coordinate = gets.chomp

    if game_board.board[row_coordinate.to_i][column_coordinate.to_i] == ' '
      player_two.mark(game_board.board[row_coordinate.to_i][column_coordinate.to_i])
      game_board.check_for_winner
      game_board.check_for_draw

      if game_board.draw
        puts 'Draw!'
        break
      elsif game_board.winner
        puts 'PLAYER 2 wins!'
        break
      end
      break
    else
      puts 'That position is not available'
    end
  end
  break if game_board.winner || game_board.draw
end
