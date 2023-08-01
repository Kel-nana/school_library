# Include necessary class files
require_relative '../classes/person'
require_relative '../classes/student'
require_relative '../classes/teacher'
require_relative '../classes/book'
require_relative '../classes/rental'
require_relative 'user_input'

class App
  attr_accessor :books, :people

  def initialize
    @books = []
    @people = []
  end

  # List all books in the library
  def list_all_books
    if @books.empty?
      puts 'No books available'
    else
      @books.each { |book| puts "Title: '#{book.title}', Author: #{book.author}" }
    end
  end

  # List all people (students and teachers) in the library
  def list_all_people
    if @people.empty?
      puts 'No person created yet'
    else
      @people.each do |person|
        info = "[#{person.class}] Name: #{person.name}, ID: #{person.id}, Age: #{person.age}"
        info += ", Specialization: #{person.specialization}" if person.is_a?(Teacher)
        info += ", Classroom: #{person.classroom}" if person.is_a?(Student)
        puts info
      end
    end
  end

  # Prompt the user to create a person (student or teacher)
  def create_person
    choice = get_user_input('Do you want to create a student(1) or a teacher(2)? [Input the number]:', :integer)

    case choice
    when 1
      create_student
    when 2
      create_teacher
    else
      puts 'Invalid choice. Please try again.'
      create_person
    end
  end

  # Prompt the user to create a student with required details and add to the people array
  def create_student
    age = get_user_input('Age: ', :integer)
    name = get_user_input('Name: ', :string)
    parent_permission = get_user_input('Has parent permission? [Y/N]: ', :boolean)
    classroom = get_user_input('Classroom: ', :string)
    student = Student.new(age, classroom, name, parent_permission: parent_permission)
    puts 'Person created successfully'
    @people << student
  end

  # Prompt the user to create a teacher with required details and add to the people array
  def create_teacher
    age = get_user_input('Age: ', :integer)
    name = get_user_input('Name: ', :string)
    specialization = get_user_input('Specialization: ', :string)
    teacher = Teacher.new(age, specialization, name)
    puts 'Person created successfully'
    @people << teacher
  end

  # Prompt the user to create a book with required details and add to the books array
  def create_book
    title = get_user_input('Title: ', :string)
    author = get_user_input('Author: ', :string)
    book = Book.new(title, author)
    puts 'Book created successfully'
    @books << book
  end

  # Prompt the user to create a rental for a book and a person
  def create_rental
    if @books.empty?
      puts 'No books available to rent'
    else
      display_books
      if @people.empty?
        puts 'No persons created. Kindly create a person before renting'
      else
        display_people
        date = get_user_input('Date: ', :string)
        Rental.new(date, @selected_book, @selected_person)
        puts 'Rental created successfully'
      end
    end
  end

  # Display all books with corresponding index and store user-selected book
  def display_books
    list_all_books
    index = get_user_input('Select a book by number: ', :integer)
    @selected_book = @books[index]
  end

  # Display all people with corresponding index and store user-selected person
  def display_people
    list_all_people
    index = get_user_input('Select a person by number: ', :integer)
    @selected_person = @people[index]
  end

  # List rentals for a specific person by their ID
  def list_rentals_of_person
    id = get_user_input('ID of Person: ', :integer)
    person_selected = @people.find { |person| person.id == id }
    if person_selected.nil?
      puts 'No such person exists'
    else
      puts 'Rentals: '
      person_selected.rentals.each do |rental|
        puts "Date: #{rental.date}, Book '#{rental.book.title}' by #{rental.book.author}"
      end
    end
  end
end
