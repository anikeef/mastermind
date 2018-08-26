class AskingPlayer
  attr_accessor :code

  def evaluate(suggestion)
    puts "Computer's suggestion is #{suggestion}"
    begin
      print "Evaluate it like A(bulls)B(cows) (e.g. A1B2): "
      evaluation = gets.chomp
      raise unless /\AA\dB\d\Z/i.match?(evaluation)
      evaluation
    rescue
      puts "Incorrect input, try again"
      retry
    end
  end
end
