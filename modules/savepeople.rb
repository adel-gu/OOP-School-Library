require 'json'

module Savepeople
  FILE_NAME = "./database/people.json"

  def read_file
    file = File.read(FILE_NAME)
    data = [*JSON.load(file)]
    return data
  end

  private :read_file

  def get_people
    people = read_file()
    return people
  end

  def save_person(person)
    people = read_file()

    case person
    when Student
      # people << {
      #   id: person.id,
      #   age: person.age,
      #   name: person.name,
      # }
      p person
      p person.id
      p person.name
      p person.age
      p person.rentals
    when Teacher
      # people << {
      #   "specialization": person.specialization,
      #   "age": person.age,
      #   "name": person.name
      # }
      p person.age
    end

    File.write(FILE_NAME, JSON.dump(people))
  end
end
