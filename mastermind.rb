# frozen_string_literal: true

class Mastermind
  COLORS = %w[red blue green yellow orange purple].freeze

  def initialize(code_length = 4)
    @code_length = code_length
    @secret_code = generate_secret_code
  end

  def generate_secret_code
    Array.new(@code_length) { COLORS.sample }
  end

  def display_secret_code
    puts "Secret code: #{@secret_code.join(', ')}"
  end

  def play
    play = Gusses.new(@secret_code)

    3.times do |i|
      if play.pin == 4
        puts 'You won!'
        break
      else
        play.prompt_user if i < 2
      end
    end
  end
end

class Gusses
  def initialize(secret_code)
    @secret_code = secret_code
    @guess = prompt_user
  end

  def prompt_user
    guess = Array.new(4) do |index|
      puts "Enter guess #{index + 1}: "
      gets.chomp
    end
    @guess = guess
  end

  def pin
    correct_positions = 0
    right_color = @guess.count { |color| @secret_code.include?(color) }
    @guess.each_with_index do |color, index|
      correct_positions += 1 if color == @secret_code[index]
    end
    white_pin = right_color - correct_positions

    puts "#{white_pin} white pins = right color wrong positions"
    puts "#{correct_positions} black pins = right color and positions"
    correct_positions
  end
end

# Example usage
game = Mastermind.new
game.display_secret_code

game.play
game.display_secret_code
