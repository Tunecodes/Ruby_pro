class ComputerGuess
  COLORS = %w[red blue green yellow orange purple].freeze

  def initialize(player_code)
    @player_code = player_code
    @computer_guess = Array.new(4) { COLORS.sample }
  end

  def compare_guess
    @computer_guess.each_with_index do |color, index|
      @computer_guess[index] = (color if color == @player_code[index])
      @computer_guess.map! { |element| element.nil? ? COLORS.sample : element }
    end
    @computer_guess.inspect
  end
end
