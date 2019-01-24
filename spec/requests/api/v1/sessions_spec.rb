require 'rails_helper'

RSpec.describe 'Sessions API', type: :request do
  let(:user) { create(:user) }
  let(:headers) do
    {
        'Accept' => 'application/vnd.glass.v1',
        'Content-Type' => Mime[:json].to_s
        #'Authorization' => user.auth_token
    }
  end

  describe 'POST /api/v1/sessions' do
    before do
      post '/api/v1/sessions', params: { session: credentials }.to_json, headers: headers
    end

    context 'when the credentials are correct' do
      let(:credentials) { { email: user.email, password: '123456' } }

      it 'return status code 200' do
        expect(response).to have_http_status(200)
      end

      it 'returns the json data for the user with auth token' do
        expect(json_body[:auth_token]).to eq(user.auth_token)
      end
    end

    context 'when the credentials are incorrect' do
      let(:credentials)  { { email: user.email, password: 'invalid_pawwword'} }

      it 'returns status code 401' do
        expect(response).to have_http_status(401)
      end
      it 'returns the json data for the errors' do
        expect(json_body).to have_key(:errors)
      end

    end
  end
end