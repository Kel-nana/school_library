module LoadData
  def load_data
    load_books
    load_people
    load_rentals
  end

  def load_books
    return unless File.exist?('data/book.json') && !File.empty?('data/book.json')

    json_data = File.read('data/book.json')
    @books = JSON.parse(json_data).map { |book_data| Book.from_json(book_data) }
  end

  def load_people
    return unless File.exist?('data/person.json') && !File.empty?('data/person.json')

    json_data = File.read('data/person.json')
    parsed_data = JSON.parse(json_data)
    @people = parsed_data.map do |person_data|
      case JSON.parse(person_data)['type']
      when 'Student'
        Student.from_json(person_data)
      when 'Teacher'
        Teacher.from_json(person_data)
      end
    end
  end

  def load_rentals
    return unless File.exist?('data/rental.json') && !File.empty?('data/rental.json')

    json_data = File.read('data/rental.json')
    @rentals = JSON.parse(json_data).map do |rental_data|
      Rental.from_json(rental_data, @books, @people)
    end
  end
end
