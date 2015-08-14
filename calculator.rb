# calculator.rb 

# Just a simple calculator that does arithmetic with whatever 2 variables it's
# initialized with.

class Calculator
  def initialize(val1, val2)
    @val1 = val1.to_f
    @val2 = val2.to_f
  end

  def add
    @val1 + @val2
  end

  def subtract
    @val1 - @val2
  end

  def multiply
    @val1 * @val2
  end

  def divide
    if @val2 == 0
      "Error: You can't divide by zero."
    else  
      @val1 / @val2
    end
  end

  def to_s
    "The values currently being used are #{@val1} and #{@val2}."
  end
end

calc = Calculator.new(3, 5)

puts calc
