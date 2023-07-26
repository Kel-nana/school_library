# This is a class representing an abstract concept of something that can be named.
class Nameable
  # This method is meant to be implemented by subclasses.
  # It should return the correct name for the specific instance of the subclass.
  # When called on an instance of the base 'Nameable' class, it raises a 'NotImplementedError' to indicate it is abstract.
  def correct_name
    raise NotImplementedError, "Subclasses must implement the 'correct_name' method."
  end
end
