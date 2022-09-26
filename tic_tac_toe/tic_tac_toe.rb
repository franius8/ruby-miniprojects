# frozen_string_literal: true

WINNING_COMBINATIONS = [[1, 2, 3], [4, 5, 6], [7, 8, 9], [1, 4, 7], [2, 5, 8], [3, 6, 9], [1, 5, 9], [3, 5, 7]].freeze

# Plays endless games until user exits
class TicTacToe
  def initialize
    loop do
      game = Game.new
      game.play
      puts 'Play again? (Y/N)'
      choice = gets.chomp
      return unless choice == 'Y'
    end
  end
end

# Plays one TicTacToe game
class Game
  attr_reader :board, :player1, :player2

  def initialize
    @board = Array.new(10)
    @board[0] = 'not_used'
    print "Enter first player's name: "
    player_1_name = gets.chomp
    print "Enter second player's name: "
    player_2_name = gets.chomp
    @players = [Player.new(self, 'x', player_1_name), Player.new(self, 'o', player_2_name)]
    @current_player_index = 0
  end

  def play
    puts "+-------+\nTicTacToe\n+-------+"
    print_board
    puts round
  end

  def round
    loop do
      place_marker(@players[@current_player_index])
      print_board
      return "#{@players[@current_player_index].name} won!" if won?(@players[@current_player_index])
      return 'Draw' if board_full?

      switch_player
    end
  end

  def place_marker(player)
    puts "#{player.name} please select position for your marker"
    position = player.position_selection
    @board[position] = player.marker
  end

  def available_positions
    available_positions = []
    @board.each_index { |i| available_positions << i if @board[i].nil? }
    available_positions
  end

  def switch_player
    @current_player_index = @current_player_index.zero? ? 1 : 0
  end

  def board_full?
    @board[1..10].none?(&:nil?)
  end

  def won?(player)
    WINNING_COMBINATIONS.any? { |line| line.all? { |position| @board[position] == player.marker } }
  end

  def print_board
    col_separator = ' | '
    row_separator = '--+---+--'
    label_for_position = proc { |position| @board[position] || position }
    row_for_display = proc { |row| row.map(&label_for_position).join(col_separator) }
    row_positions = [[1, 2, 3], [4, 5, 6], [7, 8, 9]]
    rows_for_display = row_positions.map(&row_for_display)
    puts rows_for_display.join("\n#{row_separator}\n")
  end
end

# Defines player attributes for the TicTacToe game
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
      exit(0) if selection.zero?
      return selection if @game.available_positions.include?(selection)

      puts 'Selection already taken'
    end
  end
end

TicTacToe.new
