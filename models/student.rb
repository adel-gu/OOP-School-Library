require_relative 'person'

class Student < Person
  def initialize(name = 'Unkown', parent_permission = true, age, classroom)
    super(name, age, parent_permission)
    @classroom = classroom
  end

  # Public methods
  def play_hooky
    "¯\(ツ)/¯"
  end
end

s_1 = Student.new(23, 'AM1')
p s_1.play_hooky