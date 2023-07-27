# The Book class represents a book with its title, author, and a list of rentals.
class Book
  # Getter and Setter for the title, author, and rentals of the book.
  attr_accessor :title, :author, :rentals

  # Initializes a new instance of the Book class with the given title and author.
  # Params:
  # +title+:: A string representing the title of the book.
  # +author+:: A string representing the author of the book.
  def initialize(title, author)
    @title = title
    @author = author
    @rentals = [] # Initialize an empty array to store the rentals associated with this book.
  end

  # Adds a rental to the list of rentals associated with this book.
  def add_rental(rental)
    @rentals.push(rental)
    @rentals << rental
  end
end
