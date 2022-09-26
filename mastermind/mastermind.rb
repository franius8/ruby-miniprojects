# frozen_string_literal: true

ALLOWED_COLORS = %w[red white yellow blue orange purple].freeze
ALL_COMBINATIONS = ALLOWED_COLORS.repeated_permutation(4).to_a.select { |array| array.uniq.length == array.length }

# Methods common to both player and computer rounds
module CommonElements
  def collect(name)
    loop do
      puts "Enter your #{name} separated by spaces: "
      @choice = gets.chomp.split(' ')
      return @choice unless valid? == false

      puts "#{name.capitalize} contains invalid colors. Enter it again."
    end
  end

  def valid?
    @choice.all? { |color| ALLOWED_COLORS.include?(color) }
  end

  def check_exactly_correct(guess, code)
    result = 0
    guess.each_with_index { |color, i| result += 1 if color == code[i] }
    result
  end

  def check_included(guess, code)
    result = 0
    guess.each { |color| result += 1 if code.include?(color) }
    result
  end

  def won_game
    puts "#{@name} guessed correctly in #{@turn_number} guesses!"
    puts "The code was #{@code.join(' ')}."
  end

  def lost_game
    puts "#{@name} did not guess correctly in the allotted time!"
    puts "The code was #{@code.join(' ')}."
  end

  def increase_turn
    @turn_number += 1
  end
end

# Start a game and allow the player to choose whether they want to guess or provide the coe
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
      choice = gets.chomp.upcase
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
  include CommonElements
  def initialize
    @code = ALLOWED_COLORS.sample(4)
    @turn_number = 1
    @name = 'You'
  end

  def play
    loop do
      @guess = collect('guess')
      return won_game if check_exactly_correct(@guess, @code) == 4

      check_guess
      return lost_game if @turn_number == 12
    end
  end

  def check_guess
    exactly_correct = check_exactly_correct(@guess, @code)
    included = check_included(@guess, @code) - exactly_correct
    puts '---------------------------------'
    puts "Right color, right position: #{exactly_correct}"
    puts "Right color, wrong position: #{included}"
    puts '---------------------------------'
    increase_turn
  end
end

# Play a round with the computer guessing
class RoundComputer
  include CommonElements
  def initialize
    @turn_number = 1
    @name = 'The computer'
    @code = collect('code')
    @previous_guesses = []
  end

  def play
    loop do
      guess
      @previous_guesses << @guess
      return won_game if check_exactly_correct(@guess, @code) == 4

      increase_turn
      return lost_game if @turn_number == 12

      narrow_possibilities
    end
  end

  def guess
    return @guess = ALLOWED_COLORS.sample(4) if @guess.nil?

    loop do
      new_guess = @possibilities.sample(1).flatten
      return @guess = new_guess unless @previous_guesses.include?(new_guess)
    end
  end

  def narrow_possibilities
    @possibilities = if @possibilities.nil?
                       ALL_COMBINATIONS.select { |poss| compare_exactly_correct(poss) && compare_included(poss) }
                     else
                       @possibilities.select { |poss| compare_exactly_correct(poss) && compare_included(poss) }
                     end
  end

  def compare_exactly_correct(poss)
    check_exactly_correct(@guess, poss) == check_exactly_correct(@guess, @code)
  end

  def compare_included(poss)
    check_included(@guess, poss) == check_included(@guess, @code)
  end
end

Game.new
