require_relative './models/student'
require_relative './models/teacher'

class App

  def initialize
    # Print commands
    @cmd = {
      "1": 'List all books',
      "2": 'List all people',
      "3": 'Create a person',
      "4": 'Create a book',
      "5": 'Create a rental',
      "6": 'List all rentals for a given person id',
      "7": 'Exit'
    }
    # List of books
    @books = []

    # List of persons
    @persons = []
  end

  # Run the program
  def run
    puts 'Please choose an option by entering a number:'
    @cmd.each do |index, command|
      puts "#{index} - #{command}"
    end
  end

  # get the user input
  def get_input
    option = gets.chomp
    return "#{option}"
  end


end

# Main
def main
  app = App.new
  app.run()
  user_input = app.get_input()
  app.create_person
end

main()