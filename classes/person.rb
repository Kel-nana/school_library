# Import the 'Nameable' decorator from the specified path.
require_relative '../decorators/nameable'

# Define the 'Person' class, which extends the 'Nameable' class.
class Person < Nameable
  # Create a read-only attribute 'id' using 'attr_reader'.
  attr_reader :id

  # Create read and write attributes 'name' and 'age' using 'attr_accessor'.
  attr_accessor :name, :age, :rentals

  # Constructor for the 'Person' class.
  def initialize(age, name = 'Unknown', parent_permission: true)
    # Generate a random number between 1 and 1000 and assign it to the instance variable '@id'.
    super()
    @id = rand(1..1000)

    # Assign the 'name' and 'age' parameters to their respective instance variables '@name' and '@age'.
    @name = name
    @age = age

    # Assign the 'parent_permission' parameter to the instance variable '@parent_permission'.
    @parent_permission = parent_permission

    # Create an empty list called 'rentals' to store information about books they rented.
    @rentals = []
  end

  # Define a method called 'can_use_services?' to check if the person is allowed to use services.
  # A person can use services if they are of age (18 years or older) or if they have parent permission.
  def can_use_services?
    @age >= 18 || @parent_permission
  end

  # Define the 'correct_name' method as required by the 'Nameable' class.
  # This method returns the person's name.
  def correct_name
    @name
  end

  # Adds a new rental transaction to the list of rentals associated with the person.
  # If a rental with the same date and book already exists in the rentals list, it avoids duplicates.
  def add_rental(date, book)
    @rentals.push(Rental.new(date, self, book)) unless rental_exists?(date, book)
  end

  private

  # Define a private method called 'rental_exists?' to check if a rental with the given date and book already exists.
  # This method is used to avoid adding duplicate rentals to the 'rentals' list.
  def rental_exists?(date, book)
    @rentals.any? { |rental| rental.date == date && rental.book == book }
  end
end
