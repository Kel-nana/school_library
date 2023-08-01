require_relative 'base_decorator'

# 'TrimmerDecorator' class inherits from the 'Decorator' class
class TrimmerDecorator < Decorator
  # This method overrides the 'correct_name' method from the parent class ('Decorator')
  def correct_name
    # The '@nameable.correct_name' calls the 'correct_name' method of the wrapped 'Nameable' object.
    @nameable.correct_name.length > 10 ? @nameable.correct_name[0..9] : @nameable.correct_name
  end
end
