# frozen_string_literal: true

WINNING_COMBINATIONS = [[1, 2, 3], [4, 5, 6], [7, 8, 9], [1, 4, 7], [2, 5, 8], [3, 6, 9], [1, 5, 9], [3, 5, 7]]

class Game
  attr_reader :board

  def initialize
    @board = Array.new(10)
    @board[0] = 'not_used'
  end

  def available_positions
    available_positions = []
    @board.each_index { |i| available_positions << i + 1 if @board[i].nil? }
    available_positions
  end

  def board_full?
    @board[1..10].none?(&:nil?)
  end

  def won?(player1)
    WINNING_COMBINATIONS.any? { |line| line.all? { |position| @board[position] == player1.marker } }
  end
end

class Player
  attr_reader :number, :marker

  def initialize(number, marker)
    @number = number
    @marker = marker
  end
end

game = Game.new
puts game.available_positions
print game.board
player1 = Player.new(1, 'x')
puts game.won?(player1)
