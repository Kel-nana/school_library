# The Book class represents a book with its title, author, and a list of rentals.
class Book
  # Getter and Setter for the title, author, and rentals of the book.
  attr_accessor :title, :author, :rentals

  # Initializes a new instance of the Book class with the given title and author.

  def initialize(title, author)
    @title = title
    @author = author
    @rentals = [] # Initialize an empty array to store the rentals associated with this book.
  end

  # Adds a rental to the list of rentals associated with this book.
  def add_rental(date, person)
    @rentals.push(Rental.new(date, self, person)) unless @rentals.include?(Rental.new(date, self, person))
  end

  def to_json(*args)
    {
      'title' => @title,
      'author' => @author
    }.to_json(*args)
  end

  def self.from_json(json)
    data = JSON.parse(json)
    new(data['title'], data['author'])
  end
end
