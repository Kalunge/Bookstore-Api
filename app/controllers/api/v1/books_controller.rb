# require 'net/http'

class Api::V1::BooksController < ApplicationController
  MAX_PAGINATION_LIMIT = 100
  def index
    books = Book.limit(limit).offset(params[:offset])
    render json: BooksRepresenter.new(books).as_json
  end

  def create
    author = Author.create!(author_params)
    book = author.books.create!(book_params)

    # uri = URI('http://localhost:4567//update_sku')
    # Net::HTTP::Post.new(uri, 'Content-TYpe' => "application/json")
    if book.save
      render json: BookRepresenter.new(book).as_json, status: :created
    else
      render json: book.errors, status: :unprocessable_entity
    end
  end

  def destroy
    Book.find(params[:id]).destroy!

    head :no_content
  end

  private

  def limit
    [params.fetch(:limit, MAX_PAGINATION_LIMIT).to_i, 100].min
  end

  def author_params
    params.require(:author).permit(:first_name, :last_name, :age)
  end

  def book_params
    params.require(:book).permit(:title)
  end
end
