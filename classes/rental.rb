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
      'book' => @book.to_json,
      'person' => @person.to_json
    }.to_json(*args)
  end

  def self.from_json(json_data, books, people)
    rental_data = json_data
    date = rental_data['date']
    book_data = rental_data['book']
    person_data = rental_data['person']
    

      book = find_book_by_title(book_data['title'], books)
      person = find_person_by_id(person_data['id'], people)

    Rental.new(date, book, person)
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
