# Import the 'Person' class from the 'person.rb' file using 'require_relative'.
require_relative 'person'

# Define a new class 'Teacher' that inherits from the 'Person' class.
class Teacher < Person
  attr_reader :specialization

  # Constructor for the 'Teacher' class.
  def initialize(age, specialization, name = 'Unknown', parent_permission: true)
    # Call the 'initialize' method of the superclass 'Person' using the 'super' keyword.

    super(age, name, parent_permission: parent_permission)

    # Assign the 'specialization' parameter to an instance variable '@specialization'.
    @specialization = specialization
  end

  # Override the 'can_use_services?' method of the superclass 'Person'.
  def can_use_services?
    true
  end
end
