# The following lines import the necessary classes from their respective files.
require_relative './classes/person'
require_relative './decorators/capitalize_decorator'
require_relative './decorators/trimmer_decorator'

# Create a new 'Person' object with age 22 and name 'maximilianus'
person = Person.new(22, 'maximilianus')

# Call the 'correct_name' method on the 'Person' object
# Since 'Person' class inherits from 'Nameable', it must have implemented 'correct_name'
p person.correct_name

# Create a new 'CapitalizeDecorator' object, passing the 'Person' object as an argument
# This will wrap the 'Person' object with the capitalization functionality
capitalized_person = CapitalizeDecorator.new(person)

# Call the 'correct_name' method on the 'CapitalizedPerson' object
# The 'correct_name' method in 'CapitalizeDecorator' modifies the name by capitalizing its first letter
p capitalized_person.correct_name

# Create a new 'TrimmerDecorator' object, passing the 'CapitalizedPerson' object as an argument
# This will wrap the 'CapitalizedPerson' object with the trimming functionality
capitalized_trimmed_person = TrimmerDecorator.new(capitalized_person)

# Call the 'correct_name' method on the 'CapitalizedTrimmedPerson' object
# The 'correct_name' method in 'TrimmerDecorator' modifies the name by trimming it to a maximum length of 10 characters
p capitalized_trimmed_person.correct_name
