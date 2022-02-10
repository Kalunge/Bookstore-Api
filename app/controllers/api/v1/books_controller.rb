class Api::V1::BooksController < ApplicationController
  include ActionController::HttpAuthentication::Token

  MAX_PAGINATION_LIMIT = 100

  before_action :authenticate_user, only: %i[create destroy]
  def index
    books = Book.limit(limit).offset(params[:offset])
    render json: BooksRepresenter.new(books).as_json
  end

  def create
    # TODO: send author id in url params
    author = Author.create!(author_params)
    book = author.books.create!(book_params)

    UpdateSkuJob.perform_later(book_params[:title])

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

  def authenticate_user
    # Authorization: Bearer <token>
    token, _options = token_and_options(request)
    user_id = AuthenticationTokenService.decode(token)
    User.find(user_id)
  rescue ActiveRecord::RecordNotFound, JWT::DecodeError
    render status: :unauthorized
  end

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
