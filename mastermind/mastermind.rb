ALLOWED_COLORS = %w[red white yellow blue orange purple]

class Round
  def initialize
    @code = %w[red white yellow blue]
    @turn_number = 1
  end

  def play
    loop do
      collect_guess
      return won_game if check_exactly_correct == 4
      check_guess
      return lost_game if @turn_number == 12
    end
  end

  def check_guess
    exactly_correct = check_exactly_correct
    included = check_included - exactly_correct
    puts "Right color and right position: #{exactly_correct}"
    puts "Right color, wrong position: #{included}"
    increase_turn
  end

  def check_exactly_correct
    result = 0
    @guess.each_with_index { |color, i| result += 1 if color == @code[i] }
    result
  end

  def check_included
    result = 0
    @guess.each { |color| result += 1 if @code.include?(color) }
    result
  end

  def collect_guess
    loop do
      puts 'Enter your guess separated by spaces: '
      @guess = gets.chomp.split(' ')
      return unless guess_valid? == false
      puts 'Guess contains invalid colors. Enter it again.'
    end
  end

  def increase_turn
    @turn_number += 1
  end

  def won_game
    puts "You guessed correctly in #{@turn_number} guesses! Congrats!"
    puts "The code was #{@code.join(' ')}"
  end

  def lost_game
    puts "You did not guess correctly in the allotted time!"
    puts "The code was #{@code.join(' ')}"
  end

  def guess_valid?
    @guess.all? {|color| ALLOWED_COLORS.include?(color)}
  end
end

round = Round.new
round.play
