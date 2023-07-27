# Include the required files
require_relative './app/app'
require_relative './app/options'

# The main function of the application.
def main
  # Create an instance of the App class
  app = App.new

  # Display a welcome message to the user
  puts 'Welcome to the School Library App!'

  # Call the options method to present the menu and handle user inputs
  options(app)
end

# Call the main function to start the application
main
