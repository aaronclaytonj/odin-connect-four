require_relative ('board')
require_relative ('player')


class Game
  attr_reader :player1, :player2, :board, :curr_player

  def initialize
    @player1 = Player.new(:x)
    @player2 = Player.new(:o)
    @board = Board.new
    @curr_player = player1
  end

  def play
    get_players
    loop do
      board.display
      inp = player_input
      board.update(inp, curr_player.symbol)
      break if game_over? || draw?
      @curr_player = swap_player
    end
    board.display
  end

  def draw?
    board.draw?
  end

  def game_over?
    6.times do |row|
      7.times do |column|
        if @board.check_win(row, column, curr_player.symbol)
          puts "\e[35m#{curr_player.name}\e[0m won!"
          return true
        end
      end
    end
    false
  end

  def player_input
    # return 0
    loop do
      puts "#{curr_player.name}- please select a column"
      input = gets.chomp.to_i - 1
      return input.to_i if verify_input(input)

      puts "Invalid input"
    end
  end

  def verify_input(input)
    input.between?(0,6) and !board.col_full?(input)
  end

  def swap_player
    curr_player == player1 ? player2 : player1
  end

  

  private

  def get_name(num)
    # return "name"
    puts "Player #{num}, please enter your name:"
    gets.chomp
  end

  def get_players
    @player1.update_name(get_name(1))
    @player2.update_name(get_name(2))
  end
end