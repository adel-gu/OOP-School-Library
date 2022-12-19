require_relative 'person'

class Student < Person
  # constructor
  def initialize(name = 'Unkown', parent_permission = true, age, classroom)
    super(name, age, parent_permission)
    @classroom = classroom
  end

  # Public methods
  def play_hooky
    "¯\(ツ)/¯"
  end
end
