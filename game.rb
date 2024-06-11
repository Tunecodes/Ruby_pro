# frozen_string_literal: true

class Game
  def initialize
    @board = Array.new(3) { Array.new(3, ' ') }
  end

  def display_board
    puts " #{@board[0][0]} | #{@board[0][1]} | #{@board[0][2]} "
    puts '---+---+---'
    puts " #{@board[1][0]} | #{@board[1][1]} | #{@board[1][2]} "
    puts '---+---+---'
    puts " #{@board[2][0]} | #{@board[2][1]} | #{@board[2][2]} "
  end

  def winner?
    # Check rows and columns
    3.times do |i|
      return true if @board[i][0] == @board[i][1] && @board[i][1] == @board[i][2] && @board[i][0] != ' '
      return true if @board[0][i] == @board[1][i] && @board[1][i] == @board[2][i] && @board[0][i] != ' '
    end

    # Check diagonals
    return true if @board[0][0] == @board[1][1] && @board[1][1] == @board[2][2] && @board[0][0] != ' '
    return true if @board[0][2] == @board[1][1] && @board[1][1] == @board[2][0] && @board[0][2] != ' '

    # No win condition met
    false
  end

  def play
    players = Players.new(@board)

    until winner?
      players.player1_move
      display_board
      break if winner?

      players.player2_move
      display_board
    end

    puts winner? ? 'We have a winner!' : "It's a draw!"
  end
end

class Players
  def initialize(board)
    @board = board
  end

  def make_move(player_symbol)
    valid = false
    until valid
      puts "Enter row and column for #{player_symbol} (e.g., 0 1):"
      row, col = gets.split.map(&:to_i)
      if row.between?(0, @board.length - 1) && col.between?(0, @board[0].length - 1)
        if @board[row][col] == ' '
          @board[row][col] = player_symbol
          valid = true
        else
          puts 'Cell already taken, try again.'
        end
      else
        puts 'Out of bounds, try again.'
      end
    end
  end

  def player1_move
    make_move('X')
  end

  def player2_move
    make_move('O')
  end
end

# Start the game
game = Game.new
game.play
