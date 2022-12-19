class Person
  # Constructor
  def initialize(age, name = 'Unkown', parent_permission: true)
    @id = Random.rand(1..1000)
    @name = name
    @age = age
    @parent_permission = parent_permission
  end

  # getters
  attr_reader :id

  # accessor
  attr_accessor :name, :age

  # Privet Methods
  def of_age?
    @age >= 18
  end

  private :is_of_age?

  # Public methods
  def can_use_services?
    is_of_age? || @parent_permission
  end
end
