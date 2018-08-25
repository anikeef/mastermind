class AskingPlayer
  attr_accessor :code

  def initialize
    begin
      print "Enter your 4-digit code (e.g. 1234): "
      @code = gets.chomp
      raise unless /\A\d{4}\Z/.match?(code)
    rescue
      puts "Incorrect input, try again"
      retry
    end
  end
  def evaluate(suggestion)
    puts "Suggestion is #{suggestion}"
    begin
      print "Evaluate it like A(bulls)B(cows) (e.g. A1B2): "
      evaluation = gets.chomp
      raise unless /\AA\dB\d\Z/i.match?(evaluation)
      /\AA4B0\Z/i.match?(evaluation) ? "Computer's win! The right answer is #{code}!" : evaluation
    rescue
      puts "Incorrect input, try again"
      retry
    end
  end
end

#a = AskingPlayer.new
