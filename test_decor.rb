# The following lines import the necessary classes from their respective files.
require_relative 'classes/person'
require_relative 'decorators/capitalize_decorator'
require_relative 'decorators/trimmer_decorator'

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

p capitalized_trimmed_person.correct_name
