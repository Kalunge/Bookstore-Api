require 'rails_helper'

describe 'Books API', type: :request do
  let(:first_author) { FactoryBot.create(:author, first_name: 'Timothy', last_name: 'Keller', age: 70) }
  let(:second_author) { FactoryBot.create(:author, first_name: 'John', last_name: 'Piper', age: 75) }

  describe 'GET /books' do
    before do
      FactoryBot.create(:book, title: 'The coming to Americat', author: first_author)
      FactoryBot.create(:book, title: 'The sovereignty og God in Suffering', author: second_author)
    end
    it 'Returns all Books' do
      get '/api/v1/books'

      expect(response).to have_http_status(:success)
      expect(response_body.size).to eq(2)
      expect(response_body).to eql(
        [
          {
            'id' => 1,
            'title' => 'The coming to Americat',
            'author_name' => 'Timothy Keller',
            'author_age' => 70
          },
          {
            'id' => 2,
            'title' => 'The sovereignty og God in Suffering',
            'author_name' => 'John Piper',
            'author_age' => 75
          }
        ]
      )
    end
  end

  describe ' POST /books' do
    it 'creates a selected book' do
      expect do
        post '/api/v1/books', params: {
          book: { title: 'My best Book' },
          author: { first_name: 'Titus', last_name: 'Kalunge', age: 50 }
        }
      end.to change { Book.count }.from(0).to(1)

      expect(response).to have_http_status(:created)
      expect(Author.count).to eq(1)
      expect(response_body).to eql(
        {
          'id' => 3,
          'title' => 'My best Book',
          'author_name' => 'Titus Kalunge',
          'author_age' => 50
        }
      )
    end
  end

  describe 'DELETE /books/:id' do
    let!(:book) { FactoryBot.create(:book, title: 'The coming to Americat', author: first_author) }
    it 'Deletes a Book by id' do
      expect do
        delete "/api/v1/books/#{book.id}"
      end.to change { Book.count }.from(1).to(0)

      expect(response).to have_http_status(:no_content)
    end
  end
end
