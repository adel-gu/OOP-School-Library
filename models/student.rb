require_relative 'person'

class Student < Person
  # Setters and Getters
  attr_accessor :classroom

  # constructor
  def initialize(classroom, age, name = 'Unkown', parent_permission: true)
    super(age, name, parent_permission: parent_permission)
    @classroom = classroom
  end

  # Public methods
  def play_hooky
    '¯(ツ)/¯'
  end

  def classroom=(classroom)
    @classroom = classroom
    classroom.students.push(self) unless classroom.students.include?(self)
  end
end
