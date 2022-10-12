# frozen_string_literal: true

# Class for managing the board and main methods
class Board
  VALID_MOVES = [[1, 2], [-1, 2], [1, -2], [-1, -2], [2, 1], [-2, 1], [2, -1], [-2, -1]].freeze

  def move_checker(position, target_position)
    return 'No moves necessary!' if position == target_position

    declare_variables(position, target_position)
    checker_loop
    @final_ary = return_final_ary(@final_move)
    print_result
  end

  # List all possible moves
  def possible_moves(position)
    before_move = position.position_after
    VALID_MOVES.each do |move|
      position_after = [0, 0]
      position_after[0] = before_move[0] + move[0]
      position_after[1] = before_move[1] + move[1]
      @moves_ary << Move.new(position_after, position) if valid?(position_after)
    end
  end

  # Declare basic variables for the main method
  def declare_variables(position, target_position)
    @position = Move.new(position)
    @target_position = target_position
    @moves_ary = []
    @final_ary = []
    @final_move = nil
  end

  # Loop checking the existing possible moves and initializing creation of new ones.
  def checker_loop
    loop do
      length = @moves_ary.length
      possible_moves(@position)
      @moves_ary.each do |move|
        possible_moves(move)
        break if match?
      end
      @moves_ary.drop(length)
      break if match?
    end
  end

  # Print the result nicely
  def print_result
    puts "You made it in #{@final_ary.length} moves. Here's the path:"
    @final_ary.each {|move| print "#{move}\n"}
  end

  # Check if the move is valid
  def valid?(position)
    position[0].between?(1, 8) && position[1].between?(1, 8)
  end

  # Check if there is a match in the array
  def match?
    @moves_ary.each { |move| @final_move = move if move.position_after == @target_position }
    return true unless @final_move.nil?

    false
  end

  def return_final_ary(move)
    @final_ary << move.position_after
    return @final_ary.reverse if move.parent.nil?

    return_final_ary(move.parent)
  end
end

# Class for storing position after the move and the parent
class Move
  attr_accessor :position_after, :parent

  def initialize(position_after, parent = nil)
    @position_after = position_after
    @parent = parent
  end
end

board = Board.new

board.move_checker([1, 1], [8, 8])
