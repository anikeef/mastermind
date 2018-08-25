class AskingComputer
  attr_accessor :code

  def initialize
    @code = Array.new(4).map { rand(0..9) }.join
  end
  def evaluate(suggestion)
    bulls = 0
    cows = 0
    right_digits = code.split("")
    suggestion_digits = suggestion.split("")
    right_digits.each.with_index do |digit, index|
      if digit == suggestion_digits[index]
        bulls += 1
        right_digits[index] = "*"
        suggestion_digits[index] = "*"
      end
      cows += 1 if suggestion_digits.any? { |sug_digit| sug_digit == digit }
    end
    bulls == 4 ? "Player's win! The right answer is #{code}!" : "A#{bulls}B#{cows}"
  end
end

# a = AskingComputer.new
# puts a.evaluate("1234")
