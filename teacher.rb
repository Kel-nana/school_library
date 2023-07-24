# Import the 'Person' class from the 'person.rb' file using 'require_relative'.
require_relative 'person'

# Define a new class 'Teacher' that inherits from the 'Person' class.
class Teacher < Person
  # Constructor for the 'Teacher' class.
  # It takes four parameters: 'age', 'specialization', 'name', and 'parent_permission'.
  # The 'name' parameter has a default value of 'Unknown'.
  # The 'parent_permission' parameter uses keyword argument syntax and has a default value of 'true'.
  def initialize(age, specialization, name = 'Unknown', parent_permission: true)
    # Call the 'initialize' method of the superclass 'Person' using the 'super' keyword.
    # Pass the 'age', 'name', and 'parent_permission' arguments to the superclass's 'initialize' method.
    # 'name' is passed as an argument to match the 'Person' class's 'initialize' method signature.

    super(age, name, parent_permission: parent_permission)

    # Assign the 'specialization' parameter to an instance variable '@specialization'.
    @specialization = specialization
  end

  # Override the 'can_use_services?' method of the superclass 'Person'.
  # Teachers can always use services, so this method always returns 'true'.
  def can_use_services?
    true
  end
end
