# frozen_string_literal: true

require_relative 'playerGuess'
require_relative 'computerGuess'
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
    20.times do |i|
      next unless @player_code.inspect == computer.compare_guess
      puts "#{i} #{computer.compare_guess}"
      break
      # puts @player_code.inspect == computer.compare_guess
    end
  end

  def play
    play = PlayerGusses.new(@secret_code)
    12.times do |i|
      if play.pin == 4
        puts 'You won!'
        break
      elsif i < 2
        play.prompt_user
      end
    end
  end
end

# Example usage

print 'pick: '
choice = gets.chomp

game = Mastermind.new

if choice == '1'
  game.display
elsif choice == '2'
  game.play
end
