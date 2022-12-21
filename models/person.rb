require_relative 'nameable'
require_relative 'capitalize_decorator'
require_relative 'trimmer_decorator'
require_relative 'rental'

class Person < Nameable
  # getters and setters
  attr_reader :id
  attr_accessor :name, :age, :rentals

  # Constructor
  def initialize(age, name = 'Unkown', parent_permission: true)
    super()
    @id = Random.rand(1..1000)
    @name = name
    @age = age
    @parent_permission = parent_permission
    @rentals = []
  end

  # Privet Methods
  def of_age?
    @age >= 18
  end

  private :of_age?

  # Public methods
  def can_use_services?
    is_of_age? || @parent_permission
  end

  # Correct the person name method
  def correct_name
    @name
  end

  # Add rentals method
  def add_rental(date, book)
    Rental.new(date, book, self)
  end
end
