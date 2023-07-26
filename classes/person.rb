require_relative '../decorators/nameable'
# Define a new class 'Person'.
class Person < Nameable
  # Create a read-only attribute 'id' using 'attr_reader'.
  attr_reader :id

  # Create read and write attributes 'name' and 'age' using 'attr_accessor'.
  attr_accessor :name, :age

  # Constructor for the 'Person' class.
  # It takes three parameters: 'age', 'name', and 'parent_permission'.
  # The 'name' parameter has a default value of 'Unknown'.
  # The 'parent_permission' parameter uses keyword argument syntax and has default value of 'true'.
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
  end

  # Define a private method called 'of_age?'.
  # This method checks if the person is 18 years or older and returns 'true' if they are, 'false' otherwise.
  private def of_age?
    @age >= 18
  end

  # Define a method called 'can_use_services?'.
  # This method checks if the person is of age (18 years or older) or ('@parent_permission' is 'true').
  # It returns 'true' if the person can use services and 'false' otherwise.
  def can_use_services?
    of_age? || @parent_permission
  end

  # Define the 'correct_name' method as required by the 'Nameable' class.
  # This method returns the name of the person as their correct name.
  def correct_name
    @name
  end
  # Make the 'of_age?' method private so that it can only be accessed within the 'Person' class.
  private :of_age?
end
