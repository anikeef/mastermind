require "./evaluate.rb"

class AskingComputer
  include Evaluate
  attr_accessor :code

  def initialize
    @code = Array.new(4).map { rand(0..9) }.join
  end
end
