require_relative 'base_decorator'

# 'CapitalizeDecorator' class inherits from the 'Decorator' class
class CapitalizeDecorator < Decorator
  # This method overrides the 'correct_name' method from the parent class ('Decorator')
  def correct_name
    # The '@nameable.correct_name' calls the 'correct_name' method of the wrapped 'Nameable' object.
    @nameable.correct_name.capitalize
  end
end
