require_relative '../decorators/nameable'
class Person < Nameable
  # Create a read-only attribute 'id' using 'attr_reader'.
  attr_reader :id

  # Create read and write attributes 'name' and 'age' using 'attr_accessor'.
  attr_accessor :name, :age, :rentals

  # Constructor for the 'Person' class.
  def initialize(age, name = 'Unknown', parent_permission: true)
    # Call 'super' to initialize the state of the parent class 'Nameable'.
    super()

    # Generate a random number between 1 and 1000 and assign it to the instance variable '@id'.
    @id = rand(1..1000)

    # Assign the 'name' and 'age' parameters to their respective instance variables '@name' and '@age'.
    @name = name
    @age = age

    # Assign the 'parent_permission' parameter to the instance variable '@parent_permission'.
    @parent_permission = parent_permission

    # Create an empty list called 'rentals' to store information about books they rented.
    @rentals = []
  end

  # Define a private method called 'of_age?'.
  private def of_age?
    @age >= 18
  end

  # Define a method called 'can_use_services?'.
  def can_use_services?
    of_age? || @parent_permission
  end

  # Define the 'correct_name' method as required by the 'Nameable' class.
  def correct_name
    @name
  end
  # Make the 'of_age?' method private so that it can only be accessed within the 'Person' class.
  private :of_age?
end
