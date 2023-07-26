# The following line imports the 'Decorator' class from the file 'base_decorator.rb'
require_relative 'base_decorator'

# 'TrimmerDecorator' class inherits from the 'Decorator' class
class TrimmerDecorator < Decorator
  # This method overrides the 'correct_name' method from the parent class ('Decorator')
  # It modifies the behavior of the 'correct_name' method by trimming the name to a maximum length of 10 characters.
  def correct_name
    # The '@nameable.correct_name' calls the 'correct_name' method of the wrapped 'Nameable' object.
    # The 'length' method is used to check the length of the name returned by '@nameable.correct_name'.
    # If the length is greater than 10, it returns the first 10 characters using the '[0..9]' syntax.
    # Otherwise, it returns the original name if its length is 10 or less.
    @nameable.correct_name.length > 10 ? @nameable.correct_name[0..9] : @nameable.correct_name
  end
end
