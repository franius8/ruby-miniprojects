# frozen_string_literal: true

WINNING_COMBINATIONS = [[1, 2, 3], [4, 5, 6], [7, 8, 9], [1, 4, 7], [2, 5, 8], [3, 6, 9], [1, 5, 9], [3, 5, 7]]

class Game
  attr_reader :board

  def initialize
    @board = Array.new(10)
    @board[0] = 'not_used'
    @player1 = Player.new(self, 'x')
    @player2 = Player.new(self, 'o')
  end

  def available_positions
    available_positions = []
    @board.each_index { |i| available_positions << i if @board[i].nil? }
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

  def initialize(game, marker)
    @game = game
    @marker = marker
  end

  def position_selection
    loop do
      print 'Selection: '
      selection = gets.to_i
      return selection if @game.available_positions.include?(selection)

      puts 'Selection already taken'
    end
  end
end

game = Game.new
puts game.available_positions
print game.board
puts game.won?(game.player1)
