# The Rental class represents a rental transaction of a book to a person on a specific date.
class Rental
  # Getter and Setter for the date, book, and person attributes of the rental.
  attr_accessor :date, :book, :person

  # Initializes a new instance of the Rental class with the given date, book, and person.
  # This represents a rental transaction where a book is rented to a person on a specific date.
  def initialize(date, book, person)
    @date = date
    @book = book
    book.rentals << self
    @person = person
    person.rentals << self
  end

  def to_json(*args)
    {
      'date' => @date,
      'book' => {
        'title' => @book.title,
        'author' => @book.author
      },
      'person' => {
        'type' => @person.class.name,
        'id' => @person.id,
        'age' => @person.age,
        'name' => @person.name,
        'parent_permission' => @person.parent_permission
      }
    }.to_json(*args)
  end

  def self.from_json(json_data, books, people)
    rental_data = JSON.parse(json_data)
  
    # Access the keys directly from the rental_data hash
    book = find_book_by_title(rental_data['book']['title'], books)
    person = find_person_by_id(rental_data['person']['id'], people)
  
    Rental.new(rental_data['date'], book, person)
  end

  def load_rentals
    return unless File.exist?('data/rental.json') && !File.empty?('data/rental.json')
  
    json_data = File.read('data/rental.json')
    parsed_data = JSON.parse(json_data)
  
    # Ensure parsed_data is an array before processing
    parsed_data = [] unless parsed_data.is_a?(Array)
  
    @rentals = parsed_data.map do |rental_data|
      Rental.from_json(rental_data, @books, @people)
    end
  end
  

  def self.find_book_by_title(title, books)
    books.find { |book| book.title == title }
  end

  def self.find_person_by_id(id, people)
    people.find { |person| person.id == id.to_i }
  end
end
