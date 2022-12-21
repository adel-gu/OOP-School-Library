class Book
  # Getter and Setters
  attr_accessor :title, :author
  attr_reader :rentals

  def initialize(title, author)
    @title = title
    @author = author
    @rentals = []
  end

  # Adding rental
  def add_rental(rental)
    @rentals.push(rental) unless @rentals.inclued?(rental)
    rental.book = self
  end
end
