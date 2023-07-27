# The Classroom class represents a classroom with a label and a list of students.
class Classroom
    # Getter and Setter for the label of the classroom.
    attr_accessor :label
  
    # Initializes a new instance of the Classroom class with the given label.
    def initialize(label)
      @label = label
      @students = [] # Initialize an empty array to store the students in the classroom.
    end
  
    # Adds a student to the classroom and assigns the classroom to the student.
    def add_student(student)
      @students.push(student) unless @students.include?(student) # Add the student if not already present.
      student.classroom = self # Assign the classroom to the student.
    end
  end
  