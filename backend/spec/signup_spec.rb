require 'rails_helper'

RSpec.describe 'POST /api/v1/signup', type: :request do
  let(:url) { '/api/v1/signup' }
  let(:params) do
    {
      user: {
        name: 'Test user',
        email: 'user@example.com',
        password: 'testing123'
      }
    }
  end

  # Authentication
  context 'when user is unauthenticated' do
    before { post url, params: params }

    it 'returns 200' do
      puts response.body
      puts response.headers
      expect(response.status).to eq 200
    end

    # it 'returns a new user' do
    #   puts response.body
    #   # expect(response.body).to match_schema('user')
    # end

    it 'returns a JSON Web Token' do
      puts response.headers['Authorization']
      expect(response.headers['Authorization']).to be_present
    end
  end

  # Duplicate user
  context 'when user already exists' do
    before do
      Fabricate :user, email: params[:user][:email]
      post url, params: params
    end

    it 'returns bad request status' do
      expect(response.status).to eq 400
    end

    it 'returns validation errors' do
      json = JSON.parse(response.body)
      expect(json['errors'].first['title']).to eq('Bad Request')
    end
  end
end