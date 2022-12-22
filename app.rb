require_relative './models/student'
require_relative './models/teacher'
require_relative './models/book'

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

  # Print out all books
  def list_all_books
    puts @books
  end

  # Print out all books
  def list_all_persons
    puts @persons
  end

  # Create a person
  def create_person
    print "Do you want to create a student (1) or a teacher (2)? [Input the nummber]: "
    case gets.chomp
      when "1"
        print "Age: "
        age = gets.chomp

        print "Name: "
        name = gets.chomp

        print "Has parent permission? [Y/N]: "
        case (gets.chomp).downcase
          when "y" then parent_permission = true
          when "n" then parent_permission = false
        end

        # Create a student and push it to persons array
        @persons.push(Student.new(age, name, parent_permission))

      when "2"
        print "Age: "
        age = gets.chomp

        print "Name: "
        name = gets.chomp

        print "Specialization: "
        specialization = gets.chomp

        # Create a student and push it to persons array
        @persons.push(Teacher.new(specialization, age, name))
    end
  end

  # Create a Book
  def create_book
    print "Title: "
    title = gets.chomp

    print "Author: "
    author = gets.chomp

    # Create the book object and add it to the books list
    @books.push(Book.new(title, author))
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