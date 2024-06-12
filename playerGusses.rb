class PlayerGusses
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
