require_relative 'person'

class Teacher < Person
  # constructor
  def initialize(name = 'Unkown', parent_permission = true, age, specialization)
    super(name, age, parent_permission)
    @specialization = specialization
  end

  # Public methods
  def can_use_services?
    true
  end
end