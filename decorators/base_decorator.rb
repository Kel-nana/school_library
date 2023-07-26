# The following line imports the 'Nameable' class from the file 'nameable.rb'
require_relative './nameable'

# 'Decorator' class inherits from the 'Nameable' class
class Decorator < Nameable
  # 'attr_accessor' is a shortcut to create getter and setter methods for 'nameable' instance variable
  attr_accessor :nameable

  # The 'initialize' method is called when creating a new 'Decorator' object
  # It takes one argument, 'nameable', which is an instance of the 'Nameable' class.
  def initialize(nameable)
    # 'super()' calls the 'initialize' method of the parent class ('Nameable' in this case)
    # This is necessary since 'Decorator' is inheriting from 'Nameable'
    super()

    # Sets the 'nameable' instance variable to the 'nameable' argument passed to the constructor.
    @nameable = nameable
  end

  # This method delegates the 'correct_name' method call to the 'Nameable' object held by 'nameable'
  def correct_name
    @nameable.correct_name
  end
end
