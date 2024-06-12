# frozen_string_literal: true
require_relative 'playerGusses'
class Mastermind
  COLORS = %w[red blue green yellow orange purple].freeze

  def initialize(code_length = 4)
    @code_length = code_length
    @secret_code = generate_secret_code
  end

  def player_code
    array = Array.new(4)
    array.each_index do |i|
      array[i] = gets.chomp
    end
    
  end

  def generate_secret_code
    Array.new(@code_length) { COLORS.sample }
  end

  def display_secret_code
    puts "Secret code: #{@secret_code.join(', ')}"
  end

  def display
    @player_code = player_code

    computer = ComputerGuess.new(@player_code)
    12.times do
    computer.compare_guess
    end
  end

  def play
    play = PlayerGusses.new(@secret_code)
    12.times do |i|
      if play.pin == 4
        puts 'You won!'
        break
      else
        play.prompt_user if i < 2
      end
    end
  end
end


class ComputerGuess
  COLORS = %w[red blue green yellow orange purple].freeze


  def initialize(player_code)
    @player_code = player_code
    @computer_guess = Array.new(4) {COLORS.sample}

  end

  def compare_guess
    @computer_guess.each_with_index do |color, index|
      if @player_code.include?(color)
      end
      if color == @player_code[index]
        @computer_guess[index] = color
      else
        @computer_guess[index] = nil
      end
      @computer_guess.map! { |element| element.nil? ? COLORS.sample : element }
    end
    puts @computer_guess.inspect
  end

  def white_pin

  end
end


# Example usage

print "pick: "
choice = gets.chomp

game = Mastermind.new

if choice == "1"
game.display
elsif choice == "2"
game.play
end
