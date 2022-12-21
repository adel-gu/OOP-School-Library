class Rental
  # Getter and Setter
  attr_reader :book, :person
  attr_accessor :date

  # Constractor
  def initialize(date, book, person)
    @date = date

    @book  = book
    book.rentals << self unless book.rentals.inclued?(self)

    @person = person
    person.rentals << self unless person.rentals.inclued?(self)
  end
end