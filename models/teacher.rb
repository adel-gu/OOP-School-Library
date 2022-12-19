require_relative 'person'

class Teacher < Person
  # constructor
  def initialize(specialization, age, name = 'Unkown', parent_permission: true)
    super(age, name, parent_permission)
    @specialization = specialization
  end

  # Public methods
  def can_use_services?
    true
  end
end
