require 'rails_helper'

describe 'Authentication', type: :request do
  describe 'POST /authenticate' do
    it 'Authenticates the client and returns a token' do
      post '/api/v1/authenticate', params: { username: 'kalunge', password: 'qwerty' }

      expect(response).to have_http_status(:created)
      expect(response_body).to eq({
                                    'token' => '123'
                                  })
    end

    it 'Return error when username is missing' do
      post '/api/v1/authenticate', params: { username: 'kalunge' }
      expect(response).to have_http_status(:unprocessable_entity)
      expect(response_body).to eq({
        "errors" => "param is missing or the value is "
        })
      end
      it 'Return error when password is missing' do
        post '/api/v1/authenticate', params: { password: 'kalunge' }
        expect(response).to have_http_status(:unprocessable_entity)
        expect(response_body).to eq({
         "errors" => "param is missing or the value is "
      })
    end
  end
end
