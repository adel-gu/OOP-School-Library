class Person
  # class Vars
  @@under_age = 18

  # Constructor
  def initialize(name = 'Unkown', parent_permission = true, age)
    @id = Random.rand(1..1000)
    @name = name
    @age = age
    @parent_permission = parent_permission
  end

  # getters
  attr_reader :id
  attr_reader :name
  attr_reader :age

  # setters
  attr_writer :name
  attr_writer :age

  # Privet Methods
  def is_of_age?
    @age >= @@under_age
  end

  private :is_of_age?

  # Public methods
  def can_use_services?
    is_of_age? || @parent_permission
  end
end
