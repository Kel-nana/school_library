# This method gets input from the user and handles different types of input.
def get_user_input(prompt, type)
  # Display the prompt and get input from the user, removing any leading/trailing spaces.
  print prompt
  input = gets.chomp.strip

  # Check the type of input and convert it accordingly.
  case type
  when :integer
    input.to_i
  when :boolean
    input.downcase == 'y'
  else
    input
  end
end
