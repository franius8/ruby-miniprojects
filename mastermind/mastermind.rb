class Round
  def initialize
    @code = %w[red white yellow blue]
    @turn_number = 1
  end

  def play
    while @turn_number <= 12
      collect_guess
      check_guess  
    end
    lost_game
  end

  def check_guess
    exactly_correct = check_exactly_correct
    if exactly_correct == 4
        won_game
    else
      included = check_included - exactly_correct
      puts "Right color and right position: #{exactly_correct}"
      puts "Right color, wrong position: #{included}"
      increase_turn
    end
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
    puts 'Enter your guess separated by spaces: '
    @guess = gets.chomp.split(' ')
  end

  def increase_turn
    @turn_number += 1
  end

  def won_game
    puts "You guessed correctly in #{@turn_number} guesses! Congrats!"
    puts "The code was #{@code}"
  end

  def lost_game
    puts "You did not guess correctly in the allotted time!"
    puts "The code was #{@code}"
  end
end

round = Round.new
round.play
