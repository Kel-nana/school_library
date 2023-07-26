# Import the 'Person' class from the 'person.rb' file.
require_relative 'person'

# Define a new class 'Student' that inherits from the 'Person' class.
class Student < Person
  # Constructor for the 'Student' class, taking four parameters: 'age', 'classroom', 'name', and 'parent_permission'.
  # The 'name' parameter has a default value of 'Unknown'.
  # The 'parent_permission' parameter uses keyword argument syntax and has a default value of 'true'.
  def initialize(age, classroom, name = 'Unknown', parent_permission: true)
    # Call the 'initialize' method of the superclass 'Person' using the 'super' keyword.
    # Pass the 'age', 'name', and 'parent_permission' arguments to the superclass's 'initialize' method.
    # 'name' is passed as an argument to match the 'Person' class's 'initialize' method signature.
    super(age, name, parent_permission: parent_permission)

    # Assign the 'classroom' parameter to an instance variable '@classroom'.
    @classroom = classroom
  end

  # Define a method called 'play_hooky'.
  # This method returns the string representation of a shrugging emoticon '¯\\(ツ)/¯'.
  def play_hooky
    '¯\\(ツ)/¯'
  end
end
