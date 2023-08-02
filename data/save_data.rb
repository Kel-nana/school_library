module SaveData
    def save_data
      save_books
      save_people
      save_rentals
    end
  
    def save_books
      File.open('data/book.json', 'w') do |file|
        json_data = JSON.pretty_generate(@books.map(&:to_json))
        file.write(json_data)
      end
    end
  
    def save_people
      File.open('data/person.json', 'w') do |file|
        json_data = JSON.pretty_generate(@people.map(&:to_json))
        file.write(json_data)
      end
    end
  
    def save_rentals
      File.open('data/rental.json', 'w') do |file|
        json_data = JSON.pretty_generate(@rentals.map(&:to_json))
        file.write(json_data)
      end
    end
  end