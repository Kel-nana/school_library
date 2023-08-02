# A method to display the options menu and handle user inputs.
# The 'app' parameter represents the current instance of the App class.
def options(app)
  menu_options = {
    1 => :list_all_books,
    2 => :list_all_people,
    3 => :create_person,
    4 => :create_book,
    5 => :create_rental,
    6 => :list_rentals_of_person,
    7 => :save_data_option,  # Add the option to save data
    8 => :load_data_option,  # Add the option to load data
    9 => :exit_app
  }

  loop do
    puts "\nPlease choose an option by entering a number:"
    # Display the available menu options with corresponding numbers
    menu_options.each { |key, option| puts "#{key} - #{option.to_s.capitalize.gsub('_', ' ')}" }
    number = gets.chomp.to_i

    if menu_options.key?(number)
      send(menu_options[number], app)
      if number == 7
        app.save_data
        puts 'Data saved successfully!'
      elsif number == 8
        app.load_data
        puts 'Data loaded successfully!'
        
      end
    else
      puts 'Invalid option. Please try again.'
    end
  end
end

# Methods to handle each option from the menu:

# Display all books in the app instance.
def list_all_books(app)
  app.list_all_books
end

# Display all people in the app instance.
def list_all_people(app)
  app.list_all_people
end

# Prompt user to create a person (student or teacher) and add to the app instance.
def create_person(app)
  app.create_person
end

# Prompt user to create a book and add to the app instance.
def create_book(app)
  app.create_book
end

# Prompt user to create a rental and add to the app instance.
def create_rental(app)
  app.create_rental
end

# Prompt user to enter a person's ID and display their rentals in the app instance.
def list_rentals_of_person(app)
  app.list_rentals_of_person
end

# Add a new method to handle the "Save Data" option
def save_data_option(app)
  app.save_data
end

# Add a new method to handle the "Load Data" option
def load_data_option(app)
  app.load_data
end

# Exit the application with a farewell message.
def exit_app(_)
  puts 'Thank you for using this app!'
  exit
end
