class GuessingPlayer
  attr_reader :name

  def initialize
    @name = "Player"
  end
  def guess
    begin
      print "Your suggestion (e.g. 1234): "
      suggestion = gets.chomp
      raise unless /\A\d{4}\Z/.match?(suggestion)
      suggestion
    rescue
      puts "Incorrect input, try again"
      retry
    end
  end
end
