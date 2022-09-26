# frozen_string_literal: true

WINNING_COMBINATIONS = [[1, 2, 3], [4, 5, 6], [7, 8, 9], [1, 4, 7], [2, 5, 8], [3, 6, 9], [1, 5, 9], [3, 5, 7]]

class Game
  attr_reader :board, :player1, :player2

  def initialize
    @board = Array.new(10)
    @board[0] = 'not_used'
    @player1 = Player.new(self, 'x', 'Player 1')
    @player2 = Player.new(self, 'o', 'Player 2')
    @current_player = 1
  end

def play
  puts round()
end

  def round
    loop do
      if @current_player == 1
        place_marker(@player1)
        @current_player = 2
        return 'Player 1 won!' if won?(@player1)
      else
        place_marker(@player2)
        @current_player = 1
        return 'Player 2 won!' if won?(@player2)
      end
      return 'Draw' if board_full?()
    end
  end

  def place_marker(player)
    puts "#{player.name} please select position for your marker"
    position = player.position_selection
    @board[position] = player.marker
  end

  def end_game(player)

  end

  def available_positions
    available_positions = []
    @board.each_index { |i| available_positions << i if @board[i].nil? }
    available_positions
  end

  def board_full?
    @board[1..10].none?(&:nil?)
  end

  def won?(player)
    WINNING_COMBINATIONS.any? { |line| line.all? { |position| @board[position] == player.marker } }
  end
end

class Player
  attr_reader :number, :marker, :name

  def initialize(game, marker, name)
    @game = game
    @marker = marker
    @name = name
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
game.play

