require_relative 'nameable'

# 'Decorator' class inherits from the 'Nameable' class
class Decorator < Nameable
  attr_accessor :nameable

  # The 'initialize' method is called when creating a new 'Decorator' object
  def initialize(nameable)
    # 'super()' calls the 'initialize' method of the parent class ('Nameable' in this case)
    super()

    # Sets the 'nameable' instance variable to the 'nameable' argument passed to the constructor.
    @nameable = nameable
  end

  # This method delegates the 'correct_name' method call to the 'Nameable' object held by 'nameable'
  def correct_name
    @nameable.correct_name
  end
end
