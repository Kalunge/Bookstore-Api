require 'rails_helper'

describe 'Books API', type: :request do
  describe 'GET /books' do
    before do
      FactoryBot.create(:book, title: 'The coming to Americat', author: 'Captain marvel')
      FactoryBot.create(:book, title: 'The sovereignty og God in Suffering', author: 'Paul David')
    end
    it 'Returns all Books' do
      get '/api/v1/books'

      expect(response).to have_http_status(:success)
      expect(JSON.parse(response.body).size).to eq(2)
    end
  end

  describe ' POST /books' do
    it 'creates a selected book' do
      expect do
        post '/api/v1/books', params: { book: { title: 'My best Book', author: 'Titus Kalunge' } }
      end.to change { Book.count }.from(0).to(1)

      expect(response).to have_http_status(:created)
    end
  end

  describe 'DELETE /books/:id' do
    let!(:book) { FactoryBot.create(:book, title: 'The coming to Americat', author: 'Captain marvel') }
    it 'Deletes a Book by id' do
      expect do
        delete "/api/v1/books/#{book.id}"
      end.to change { Book.count }.from(1).to(0)

      expect(response).to have_http_status(:no_content)
    end
  end
end