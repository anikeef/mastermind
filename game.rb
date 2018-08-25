require "./guessing_player"
require "./asking_computer"

class Game
  attr_reader :player, :asking, :win

  def initialize
    @player = GuessingPlayer.new
    @asking = AskingComputer.new
  end
  def play
    12.downto(1) do |attempts|
      puts "#{attempts} attempts left"
      make_attempt
      break if win
    end
    puts "#{player.name}'s loss. The right answer is #{asking.code}" unless win
  end
  def make_attempt
    suggestion = player.guess
    evaluation = asking.evaluate(suggestion)
    if player.class == GuessingPlayer
      puts "Evaluation: #{evaluation}"
    else
      player.tips << {code: suggestion, evaluation: evaluation}
    end
    @win = true if evaluation == "#{player.name}'s win! The right answer is #{asking.code}!"
  end
end

a = Game.new
a.play
