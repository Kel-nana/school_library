# The Rental class represents a rental transaction of a book to a person on a specific date.
class Rental
  # Getter and Setter for the date, book, and person attributes of the rental.
  attr_accessor :date, :book, :person

  # Initializes a new instance of the Rental class with the given date, book, and person.
  # This represents a rental transaction where a book is rented to a person on a specific date.
  def initialize(date, book, person)
    @date = date
    @book = book
    @person = person

    # Add this rental to the list of rentals associated with the book.
    add_rental_to_book(book)

    # Add this rental to the list of rentals associated with the person.
    add_rental_to_person(person)
  end

  private

  # Add this rental to the list of rentals associated with the book.
  def add_rental_to_book(book)
    # The 'book.rentals' is a list that stores all the rentals associated with the book object.
    book.rentals << self
  end

  # Add this rental to the list of rentals associated with the person.
  def add_rental_to_person(person)
    # The 'person.rentals' is a list that stores all the rentals associated with the person object.
    person.rentals << self
  end
end
