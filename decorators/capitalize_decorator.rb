# The following line imports the 'Decorator' class from the file 'base_decorator.rb'
require_relative 'base_decorator'

# 'CapitalizeDecorator' class inherits from the 'Decorator' class
class CapitalizeDecorator < Decorator
  # This method overrides the 'correct_name' method from the parent class ('Decorator')
  # It modifies the behavior of the 'correct_name' method by capitalizing the result.
  def correct_name
    # The '@nameable.correct_name' calls the 'correct_name' method of the wrapped 'Nameable' object.
    # Then, 'capitalize' is applied to the result to capitalize the first letter of the name.
    @nameable.correct_name.capitalize
  end
end
