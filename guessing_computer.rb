require "./evaluate.rb"

class GuessingComputer
  include Evaluate
  attr_reader :name
  attr_accessor :tips, :answers

  def initialize
    @name = "Computer"
    @tips = []
    @answers = (0..9999).map { |num| num.to_s.rjust(4, "0") }
  end
  def guess
    return answers.sample if tips.length == 0
    answers.select! do |answer|
      tip = tips.last
      evaluate(answer, tip[:code]) == tip[:evaluation]
    end

    begin
      raise if answers.length == 0
      answers.sample
    rescue
      puts "OOPS! It looks like you made a mistake in your evaluations"
      raise
    end
  end
end
