# Define a new class 'Teacher' that inherits from the 'Person' class.
class Teacher < Person
  attr_accessor :specialization, :id # Add ':id' to make it accessible and settable.

  # Constructor for the 'Teacher' class.
  def initialize(age, specialization, name = 'Unknown', parent_permission: true)
    # Call the 'initialize' method of the superclass 'Person' using the 'super' keyword.

    super(age, name, parent_permission:)

    # Assign the 'specialization' parameter to an instance variable '@specialization'.
    @specialization = specialization
  end

  # Override the 'can_use_services?' method of the superclass 'Person'.
  def can_use_services?
    true
  end

  def self.from_json(json_data)
    parsed_data = JSON.parse(json_data)
    teacher = new(parsed_data['age'], parsed_data['specialization'], parsed_data['name'])
    teacher.id = parsed_data['id'].to_i
    teacher
  end

  def to_json(*args)
    {
      'type' => self.class.name,
      'id' => @id,
      'age' => @age,
      'name' => @name,
      'specialization' => @specialization
    }.to_json(*args)
  end
end
