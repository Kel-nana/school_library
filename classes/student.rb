require_relative 'person'

# Define a new class 'Student' that inherits from the 'Person' class.
class Student < Person
  attr_accessor :classroom
  # Constructor for the 'Student' class, taking four parameters: 'age', 'classroom', 'name', and 'parent_permission'.
  def initialize(age, classroom, name = 'Unknown', parent_permission: true)
    # Call the 'initialize' method of the superclass 'Person' using the 'super' keyword
    super(age, name, parent_permission: parent_permission)

    # Assign the 'classroom' parameter to an instance variable '@classroom'.
    @classroom = classroom

        # Also, we do something special when we create a new student.
    classroom.add_student(self)
  end

  # Define a method called 'play_hooky'.
  def play_hooky
    '¯\\(ツ)/¯'
  end
end
