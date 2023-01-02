require 'json'

module Savebook
  FILE_NAME = "./database/books.json"

  def read_file
    file = File.read(FILE_NAME)
    data = [*JSON.load(file)]
    return data
  end

  private :read_file

  def get_books
    books = read_file()
    return books
  end

  def save_book(book)
    books = read_file()
    books << {
      "title": book.title,
      "author": book.author
    }
    File.write(FILE_NAME, JSON.dump(books))
  end
end
