# frozen_string_literal: true

ALLOWED_COLORS = %w[red white yellow blue orange purple].freeze

class Game
  def initialize
    puts 'Welcome to the mastermind game!'
    puts '---------------------------------'
    puts 'The allowed colors are'
    puts ALLOWED_COLORS.join(' ')
    puts '---------------------------------'
    game_choice
  end

  def game_choice
    loop do
      puts 'Enter type of game (1 - you will be guessing, 2 - the computer will be guessing)'
      initialize_round(gets.to_i)
      puts 'Play again? (Y/N)'
      choice = gets.chomp
      return unless choice == 'Y'
    end
  end

  def initialize_round(choice)
    case choice
    when 1 then RoundPlayer.new.play
    when 2 then RoundComputer.new.play
    else puts 'Not a valid choice.'
    end
  end
end

# Play a round with human player guessing
class RoundPlayer
  def initialize
    @code = ALLOWED_COLORS.sample(4)
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
    puts '---------------------------------'
    puts "Right color, right position: #{exactly_correct}"
    puts "Right color, wrong position: #{included}"
    puts '---------------------------------'
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
    puts "The code was #{@code.join(' ')}."
  end

  def lost_game
    puts 'You did not guess correctly in the allotted time!'
    puts "The code was #{@code.join(' ')}."
  end

  def guess_valid?
    @guess.all? { |color| ALLOWED_COLORS.include?(color) }
  end
end

Game.new