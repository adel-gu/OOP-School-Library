require_relative './models/student'
require_relative './models/teacher'
require_relative './models/book'
require_relative './models/rental'

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

    # List of people
    @people = []
  end

  # display commands
  def display_cmd
    @cmd.each do |index, command|
      puts "#{index} - #{command}"
    end
  end

  # Print out all books
  def list_all_books
    if @books.empty?
      puts "Please insert books first!!"
    else
      @books.each_with_index do |book, index|
        puts "#{index}) Title: #{book.title}, Author: #{book.author}}"
      end
    end
  end

  # Print out all books
  def list_all_people
    if @people.empty?
      puts "Please insert people first!!"
    else
      @people.each do |person|
        puts "[#{person.class}] Name: #{person.name}, ID: #{person.id}, Age: #{person.age}"
      end
    end
  end

  def list_all_person_with_numbers
    @people.each_with_index do |person, index|
      puts "#{index}) [#{person.class}] Name: #{person.name}, ID: #{person.id}, Age: #{person.age}"
    end
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
        permission = gets.chomp.downcase
        case permission
          when "y" then parent_permission = true
          when "n" then parent_permission = false
        end

        # Create a student and push it to people array
        @people.push(Student.new("11", age, name, parent_permission: parent_permission))

      when "2"
        print "Age: "
        age = gets.chomp

        print "Name: "
        name = gets.chomp

        print "Specialization: "
        specialization = gets.chomp

        # Create a student and push it to people array
        @people.push(Teacher.new(specialization, age, name))
    end

    # Success message
    puts "Person Created successfully"
  end

  # Create a Book
  def create_book
    print "Title: "
    title = gets.chomp

    print "Author: "
    author = gets.chomp

    # Create the book object and add it to the books list
    @books.push(Book.new(title, author))

    # Success message
    puts "Book Created successfully"
  end

  # Create a rental
  def create_rental()
    # Select Book
    puts "Select a book from the following list by number"
    list_all_books()
    book_option = gets.chomp.to_i
    puts

    # Select Person
    puts "Select a person from the following list by number (not id)"
    list_all_person_with_numbers()
    person_option = gets.chomp.to_i
    puts

    # Select Date
    print "Date: "
    date = gets.chomp

    # Create the book object and add it to the books list
    Rental.new(date, @books[book_option], @people[person_option])

    # Success Message
    puts "Rental created successfully"
  end

  # List all rentals for a given person id
  def rentals_of_person()
    # Select person
    print "Id of person: "
    id = gets.chomp.to_i
    person_arr = @people.select {|person| person.id == id}

    # Print rentals for that person
    if person_arr.empty?
      puts "No person matches the given ID!!"
    else
      person_arr[0].rentals.each do |rental|
        puts "Date: #{rental.date}, Book #{rental.book.title} by #{rental.book.author}"
      end
    end

  end

  # Applay user choosed option
  def execute_user_option(user_option)
    case user_option
    when "1" then list_all_books()
    when "2" then list_all_people()
    when "3" then create_person()
    when "4" then create_book()
    when "5" then create_rental()
    when "6" then rentals_of_person()
    when "7" then exit
    end
  end

  # Run the program
  def run
    puts 'Please choose an option by entering a number:'
    display_cmd()
    user_option = gets.chomp
    execute_user_option(user_option)
    puts
  end

end

# Main
def main
  app = App.new
  loop do
    app.run()
  end
end

main()