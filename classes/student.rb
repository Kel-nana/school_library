require_relative 'person'
# Define a new class 'Student' that inherits from the 'Person' class.
class Student < Person
  attr_accessor :classroom, :id, :parent_permission # Add ':id' to make it accessible and settable.

  # Constructor for the 'Student' class, taking four parameters: 'age', 'classroom', 'name', and 'parent_permission'.
  def initialize(age, classroom, name, parent_permission: true)
    # Call the 'initialize' method of the superclass 'Person' using the 'super' keyword
    super(age, name, parent_permission: parent_permission)

    # Assign the 'classroom' parameter to an instance variable '@classroom'.
    @classroom = classroom
  end

  # Define a method called 'play_hooky'.
  def play_hooky
    '¯\\(ツ)/¯'
  end

  def self.from_json(json_data)
    parsed_data = JSON.parse(json_data)
    student = new(parsed_data['age'], parsed_data['classroom'], parsed_data['name'],
                  parent_permission: parsed_data['parent_permission'])
    student.id = parsed_data['id'].to_i
    student
  end

  def to_json(*args)
    {
      'type' => self.class.name,
      'id' => @id,
      'age' => @age,
      'name' => @name,
      'parent_permission' => @parent_permission,
      'classroom' => @classroom
    }.to_json(*args)
  end
end
