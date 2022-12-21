class Classroom
  # getter and setters
  attr_accessor :label
  attr_reader :students

  # Constructor
  def initialize(label)
    @label = label
    @students = []
  end

  # Add student methods
  def add_student(student)
    @students.push(student) unless @students.include?(student)
    student.classroom = self
  end
end