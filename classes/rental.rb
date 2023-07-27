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
    book.rentals << self # Add this rental to the list of rentals associated with the book.
    person.rentals << self # Add this rental to the list of rentals associated with the person.
  end
end
