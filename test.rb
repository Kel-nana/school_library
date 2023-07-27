# The following lines import the necessary classes from their respective files.
require_relative 'classes/person'
require_relative 'decorators/capitalize_decorator'
require_relative 'decorators/trimmer_decorator'
require_relative 'classes/classroom'
require_relative 'classes/rental'
require_relative 'classes/book'
require_relative 'classes/student'

# Create a new 'Person' object with age 22 and name 'maximilianus'
person = Person.new(22, 'maximilianus')

# Call the 'correct_name' method on the 'Person' object
p person.correct_name

# Create a new 'CapitalizeDecorator' object, passing the 'Person' object as an argument
capitalized_person = CapitalizeDecorator.new(person)

# Call the 'correct_name' method on the 'CapitalizedPerson' object
p capitalized_person.correct_name

# Create a new 'TrimmerDecorator' object, passing the 'CapitalizedPerson' object as an argument
capitalized_trimmed_person = TrimmerDecorator.new(capitalized_person)

# Call the 'correct_name' method on the 'CapitalizedTrimmedPerson' object
p capitalized_trimmed_person.correct_name

# TESTING ASSOCIATIONS
west = Classroom.new('west')
p west.label

student1 = Student.new(22, west, 'kevin')
p student1.classroom.label
book1 = Book.new('Atomic Habits', 'James Clear')
p book1.title
rental1 = Rental.new('2020-03-01', book1, student1)
p(rental1.book.rentals.map(&:date))