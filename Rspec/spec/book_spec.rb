require 'json'
require 'rspec'
require_relative '../../classes/book'
describe Book do
  let(:title) { 'Atomic Habit' }
  let(:author) { 'Kel-nana' }
  let(:book) { Book.new(title, author) }
  describe '#initialize' do
    it 'sets the title and author' do
      expect(book.title).to eq(title)
      expect(book.author).to eq(author)
    end
    it 'initializes rentals as an empty array' do
      expect(book.rentals).to be_an(Array)
      expect(book.rentals).to be_empty
    end
  end
  describe '#to_json' do
    it 'returns the book details as a JSON string' do
      expected_json = {
        'title' => title,
        'author' => author
      }.to_json
      expect(book.to_json).to eq(expected_json)
    end
  end
  describe '.from_json' do
    it 'returns a new Book object with data from JSON' do
      json_data = {
        'title' => title,
        'author' => author
      }.to_json
      new_book = Book.from_json(json_data)
      expect(new_book).to be_an_instance_of(Book)
      expect(new_book.title).to eq(title)
      expect(new_book.author).to eq(author)
    end
  end
end
