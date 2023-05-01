require_relative 'lib/game'


def game_loop
  loop do
    game = Game.new
    game.play
    break unless play_again?
  end
end


def play_again?
  puts "play again? (y/n)"
  inp = gets.chomp.split("")[0]
  inp.downcase == 'y' ? true : false
end

game_loop