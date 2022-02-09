class BooksRepresenter
  def initialize(books)
    @books = books
  end

  def as_json
    books.map do |book|
      {
        id: book.id,
        title: book.title,
        author_name: full_name(book),
        author_age: book.author.age
      }
    end
  end

  private

  def full_name(book)
    "#{book.author.first_name} #{book.author.last_name}"
  end

  attr_reader :books
end
