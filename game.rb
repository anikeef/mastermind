require "./guessing_player"
require "./asking_computer"
require "./guessing_computer"
require "./asking_player"

class Game
  attr_reader :player, :asking, :win

  def initialize
    begin
      print "Do you want to guess or to ask?\n1.Guess\n2.Ask\n3.PC vs PC\nEnter your choice (e.g. 1): "
      choice = gets.chomp
      raise unless /\A[123]\Z/.match?(choice)
    rescue
      puts "Incorrect input, try again"
      retry
    end

    case choice.to_i
    when 1
      @player = GuessingPlayer.new
      @asking = AskingComputer.new
    when 2
      @player = GuessingComputer.new
      @asking = AskingPlayer.new
    when 3
      @player = GuessingComputer.new
      @asking = AskingComputer.new
    end
  end
  def play
    12.downto(1) do |attempts|
      puts "\n#{attempts} attempts left"
      make_attempt
      break if win
    end

    if win
      puts "#{player.name}'s win!"
    else
      puts "#{player.name}'s loss."
      puts "The right answer is #{asking.code}" if player.class == GuessingPlayer
    end
  end
  def make_attempt
    suggestion = player.guess
    evaluation = asking.evaluate(suggestion)

    if player.class == GuessingPlayer
      puts evaluation
    else
      player.tips << {code: suggestion, evaluation: evaluation.upcase}
      puts "#{suggestion}: #{evaluation}"
    end
    @win = true if /\AA4B0\Z/i.match?(evaluation)
  end
end

a = Game.new
a.play
