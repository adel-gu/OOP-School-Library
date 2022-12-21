class Rental
  # Getter and Setter
  attr_accessor :date, :book

  # Constractor
  def initialize(date, book, person)
    @date = date
    @book  = book
    @person = person
  end

  # associate to a book
  def book=(book)
    @book = book
    book.rentals.push(self) unless book.rentals.inclued?(self)
  end
end